package zw.co.quantum.legend.model



import org.junit.*
import grails.test.mixin.*

@TestFor(RepaymentScheduleController)
@Mock(RepaymentSchedule)
class RepaymentScheduleControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/repaymentSchedule/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.repaymentScheduleInstanceList.size() == 0
        assert model.repaymentScheduleInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.repaymentScheduleInstance != null
    }

    void testSave() {
        controller.save()

        assert model.repaymentScheduleInstance != null
        assert view == '/repaymentSchedule/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/repaymentSchedule/show/1'
        assert controller.flash.message != null
        assert RepaymentSchedule.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/repaymentSchedule/list'


        populateValidParams(params)
        def repaymentSchedule = new RepaymentSchedule(params)

        assert repaymentSchedule.save() != null

        params.id = repaymentSchedule.id

        def model = controller.show()

        assert model.repaymentScheduleInstance == repaymentSchedule
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/repaymentSchedule/list'


        populateValidParams(params)
        def repaymentSchedule = new RepaymentSchedule(params)

        assert repaymentSchedule.save() != null

        params.id = repaymentSchedule.id

        def model = controller.edit()

        assert model.repaymentScheduleInstance == repaymentSchedule
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/repaymentSchedule/list'

        response.reset()


        populateValidParams(params)
        def repaymentSchedule = new RepaymentSchedule(params)

        assert repaymentSchedule.save() != null

        // test invalid parameters in update
        params.id = repaymentSchedule.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/repaymentSchedule/edit"
        assert model.repaymentScheduleInstance != null

        repaymentSchedule.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/repaymentSchedule/show/$repaymentSchedule.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        repaymentSchedule.clearErrors()

        populateValidParams(params)
        params.id = repaymentSchedule.id
        params.version = -1
        controller.update()

        assert view == "/repaymentSchedule/edit"
        assert model.repaymentScheduleInstance != null
        assert model.repaymentScheduleInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/repaymentSchedule/list'

        response.reset()

        populateValidParams(params)
        def repaymentSchedule = new RepaymentSchedule(params)

        assert repaymentSchedule.save() != null
        assert RepaymentSchedule.count() == 1

        params.id = repaymentSchedule.id

        controller.delete()

        assert RepaymentSchedule.count() == 0
        assert RepaymentSchedule.get(repaymentSchedule.id) == null
        assert response.redirectedUrl == '/repaymentSchedule/list'
    }
}
