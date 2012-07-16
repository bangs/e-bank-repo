package zw.co.quantum.legend.model



import org.junit.*
import grails.test.mixin.*

@TestFor(AppliedPenaltyController)
@Mock(AppliedPenalty)
class AppliedPenaltyControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/appliedPenalty/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.appliedPenaltyInstanceList.size() == 0
        assert model.appliedPenaltyInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.appliedPenaltyInstance != null
    }

    void testSave() {
        controller.save()

        assert model.appliedPenaltyInstance != null
        assert view == '/appliedPenalty/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/appliedPenalty/show/1'
        assert controller.flash.message != null
        assert AppliedPenalty.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/appliedPenalty/list'


        populateValidParams(params)
        def appliedPenalty = new AppliedPenalty(params)

        assert appliedPenalty.save() != null

        params.id = appliedPenalty.id

        def model = controller.show()

        assert model.appliedPenaltyInstance == appliedPenalty
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/appliedPenalty/list'


        populateValidParams(params)
        def appliedPenalty = new AppliedPenalty(params)

        assert appliedPenalty.save() != null

        params.id = appliedPenalty.id

        def model = controller.edit()

        assert model.appliedPenaltyInstance == appliedPenalty
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/appliedPenalty/list'

        response.reset()


        populateValidParams(params)
        def appliedPenalty = new AppliedPenalty(params)

        assert appliedPenalty.save() != null

        // test invalid parameters in update
        params.id = appliedPenalty.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/appliedPenalty/edit"
        assert model.appliedPenaltyInstance != null

        appliedPenalty.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/appliedPenalty/show/$appliedPenalty.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        appliedPenalty.clearErrors()

        populateValidParams(params)
        params.id = appliedPenalty.id
        params.version = -1
        controller.update()

        assert view == "/appliedPenalty/edit"
        assert model.appliedPenaltyInstance != null
        assert model.appliedPenaltyInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/appliedPenalty/list'

        response.reset()

        populateValidParams(params)
        def appliedPenalty = new AppliedPenalty(params)

        assert appliedPenalty.save() != null
        assert AppliedPenalty.count() == 1

        params.id = appliedPenalty.id

        controller.delete()

        assert AppliedPenalty.count() == 0
        assert AppliedPenalty.get(appliedPenalty.id) == null
        assert response.redirectedUrl == '/appliedPenalty/list'
    }
}
