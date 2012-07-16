package zw.co.quantum.legend.model



import org.junit.*
import grails.test.mixin.*

@TestFor(BulletinController)
@Mock(Bulletin)
class BulletinControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/bulletin/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.bulletinInstanceList.size() == 0
        assert model.bulletinInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.bulletinInstance != null
    }

    void testSave() {
        controller.save()

        assert model.bulletinInstance != null
        assert view == '/bulletin/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/bulletin/show/1'
        assert controller.flash.message != null
        assert Bulletin.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/bulletin/list'


        populateValidParams(params)
        def bulletin = new Bulletin(params)

        assert bulletin.save() != null

        params.id = bulletin.id

        def model = controller.show()

        assert model.bulletinInstance == bulletin
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/bulletin/list'


        populateValidParams(params)
        def bulletin = new Bulletin(params)

        assert bulletin.save() != null

        params.id = bulletin.id

        def model = controller.edit()

        assert model.bulletinInstance == bulletin
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/bulletin/list'

        response.reset()


        populateValidParams(params)
        def bulletin = new Bulletin(params)

        assert bulletin.save() != null

        // test invalid parameters in update
        params.id = bulletin.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/bulletin/edit"
        assert model.bulletinInstance != null

        bulletin.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/bulletin/show/$bulletin.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        bulletin.clearErrors()

        populateValidParams(params)
        params.id = bulletin.id
        params.version = -1
        controller.update()

        assert view == "/bulletin/edit"
        assert model.bulletinInstance != null
        assert model.bulletinInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/bulletin/list'

        response.reset()

        populateValidParams(params)
        def bulletin = new Bulletin(params)

        assert bulletin.save() != null
        assert Bulletin.count() == 1

        params.id = bulletin.id

        controller.delete()

        assert Bulletin.count() == 0
        assert Bulletin.get(bulletin.id) == null
        assert response.redirectedUrl == '/bulletin/list'
    }
}
