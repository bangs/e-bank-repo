package zw.co.quantum.legend.model



import org.junit.*
import grails.test.mixin.*

@TestFor(PenaltyController)
@Mock(Penalty)
class PenaltyControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/penalty/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.penaltyInstanceList.size() == 0
        assert model.penaltyInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.penaltyInstance != null
    }

    void testSave() {
        controller.save()

        assert model.penaltyInstance != null
        assert view == '/penalty/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/penalty/show/1'
        assert controller.flash.message != null
        assert Penalty.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/penalty/list'


        populateValidParams(params)
        def penalty = new Penalty(params)

        assert penalty.save() != null

        params.id = penalty.id

        def model = controller.show()

        assert model.penaltyInstance == penalty
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/penalty/list'


        populateValidParams(params)
        def penalty = new Penalty(params)

        assert penalty.save() != null

        params.id = penalty.id

        def model = controller.edit()

        assert model.penaltyInstance == penalty
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/penalty/list'

        response.reset()


        populateValidParams(params)
        def penalty = new Penalty(params)

        assert penalty.save() != null

        // test invalid parameters in update
        params.id = penalty.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/penalty/edit"
        assert model.penaltyInstance != null

        penalty.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/penalty/show/$penalty.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        penalty.clearErrors()

        populateValidParams(params)
        params.id = penalty.id
        params.version = -1
        controller.update()

        assert view == "/penalty/edit"
        assert model.penaltyInstance != null
        assert model.penaltyInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/penalty/list'

        response.reset()

        populateValidParams(params)
        def penalty = new Penalty(params)

        assert penalty.save() != null
        assert Penalty.count() == 1

        params.id = penalty.id

        controller.delete()

        assert Penalty.count() == 0
        assert Penalty.get(penalty.id) == null
        assert response.redirectedUrl == '/penalty/list'
    }
}
