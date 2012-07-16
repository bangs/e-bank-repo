package zw.co.quantum.legend.model



import org.junit.*
import grails.test.mixin.*

@TestFor(PostingController)
@Mock(Posting)
class PostingControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/posting/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.postingInstanceList.size() == 0
        assert model.postingInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.postingInstance != null
    }

    void testSave() {
        controller.save()

        assert model.postingInstance != null
        assert view == '/posting/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/posting/show/1'
        assert controller.flash.message != null
        assert Posting.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/posting/list'


        populateValidParams(params)
        def posting = new Posting(params)

        assert posting.save() != null

        params.id = posting.id

        def model = controller.show()

        assert model.postingInstance == posting
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/posting/list'


        populateValidParams(params)
        def posting = new Posting(params)

        assert posting.save() != null

        params.id = posting.id

        def model = controller.edit()

        assert model.postingInstance == posting
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/posting/list'

        response.reset()


        populateValidParams(params)
        def posting = new Posting(params)

        assert posting.save() != null

        // test invalid parameters in update
        params.id = posting.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/posting/edit"
        assert model.postingInstance != null

        posting.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/posting/show/$posting.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        posting.clearErrors()

        populateValidParams(params)
        params.id = posting.id
        params.version = -1
        controller.update()

        assert view == "/posting/edit"
        assert model.postingInstance != null
        assert model.postingInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/posting/list'

        response.reset()

        populateValidParams(params)
        def posting = new Posting(params)

        assert posting.save() != null
        assert Posting.count() == 1

        params.id = posting.id

        controller.delete()

        assert Posting.count() == 0
        assert Posting.get(posting.id) == null
        assert response.redirectedUrl == '/posting/list'
    }
}
