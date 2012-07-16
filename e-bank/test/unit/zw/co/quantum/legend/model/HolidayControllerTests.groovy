package zw.co.quantum.legend.model



import org.junit.*
import grails.test.mixin.*

@TestFor(HolidayController)
@Mock(Holiday)
class HolidayControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/holiday/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.holidayInstanceList.size() == 0
        assert model.holidayInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.holidayInstance != null
    }

    void testSave() {
        controller.save()

        assert model.holidayInstance != null
        assert view == '/holiday/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/holiday/show/1'
        assert controller.flash.message != null
        assert Holiday.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/holiday/list'


        populateValidParams(params)
        def holiday = new Holiday(params)

        assert holiday.save() != null

        params.id = holiday.id

        def model = controller.show()

        assert model.holidayInstance == holiday
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/holiday/list'


        populateValidParams(params)
        def holiday = new Holiday(params)

        assert holiday.save() != null

        params.id = holiday.id

        def model = controller.edit()

        assert model.holidayInstance == holiday
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/holiday/list'

        response.reset()


        populateValidParams(params)
        def holiday = new Holiday(params)

        assert holiday.save() != null

        // test invalid parameters in update
        params.id = holiday.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/holiday/edit"
        assert model.holidayInstance != null

        holiday.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/holiday/show/$holiday.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        holiday.clearErrors()

        populateValidParams(params)
        params.id = holiday.id
        params.version = -1
        controller.update()

        assert view == "/holiday/edit"
        assert model.holidayInstance != null
        assert model.holidayInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/holiday/list'

        response.reset()

        populateValidParams(params)
        def holiday = new Holiday(params)

        assert holiday.save() != null
        assert Holiday.count() == 1

        params.id = holiday.id

        controller.delete()

        assert Holiday.count() == 0
        assert Holiday.get(holiday.id) == null
        assert response.redirectedUrl == '/holiday/list'
    }
}
