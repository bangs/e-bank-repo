package zw.co.quantum.legend.model



import org.junit.*
import grails.test.mixin.*

@TestFor(AppliedFeeController)
@Mock(AppliedFee)
class AppliedFeeControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/appliedFee/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.appliedFeeInstanceList.size() == 0
        assert model.appliedFeeInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.appliedFeeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.appliedFeeInstance != null
        assert view == '/appliedFee/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/appliedFee/show/1'
        assert controller.flash.message != null
        assert AppliedFee.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/appliedFee/list'


        populateValidParams(params)
        def appliedFee = new AppliedFee(params)

        assert appliedFee.save() != null

        params.id = appliedFee.id

        def model = controller.show()

        assert model.appliedFeeInstance == appliedFee
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/appliedFee/list'


        populateValidParams(params)
        def appliedFee = new AppliedFee(params)

        assert appliedFee.save() != null

        params.id = appliedFee.id

        def model = controller.edit()

        assert model.appliedFeeInstance == appliedFee
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/appliedFee/list'

        response.reset()


        populateValidParams(params)
        def appliedFee = new AppliedFee(params)

        assert appliedFee.save() != null

        // test invalid parameters in update
        params.id = appliedFee.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/appliedFee/edit"
        assert model.appliedFeeInstance != null

        appliedFee.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/appliedFee/show/$appliedFee.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        appliedFee.clearErrors()

        populateValidParams(params)
        params.id = appliedFee.id
        params.version = -1
        controller.update()

        assert view == "/appliedFee/edit"
        assert model.appliedFeeInstance != null
        assert model.appliedFeeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/appliedFee/list'

        response.reset()

        populateValidParams(params)
        def appliedFee = new AppliedFee(params)

        assert appliedFee.save() != null
        assert AppliedFee.count() == 1

        params.id = appliedFee.id

        controller.delete()

        assert AppliedFee.count() == 0
        assert AppliedFee.get(appliedFee.id) == null
        assert response.redirectedUrl == '/appliedFee/list'
    }
}
