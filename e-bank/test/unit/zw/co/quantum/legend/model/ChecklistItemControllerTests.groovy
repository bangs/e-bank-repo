package zw.co.quantum.legend.model



import org.junit.*
import grails.test.mixin.*

@TestFor(ChecklistItemController)
@Mock(ChecklistItem)
class ChecklistItemControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/checklistItem/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.checklistItemInstanceList.size() == 0
        assert model.checklistItemInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.checklistItemInstance != null
    }

    void testSave() {
        controller.save()

        assert model.checklistItemInstance != null
        assert view == '/checklistItem/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/checklistItem/show/1'
        assert controller.flash.message != null
        assert ChecklistItem.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/checklistItem/list'


        populateValidParams(params)
        def checklistItem = new ChecklistItem(params)

        assert checklistItem.save() != null

        params.id = checklistItem.id

        def model = controller.show()

        assert model.checklistItemInstance == checklistItem
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/checklistItem/list'


        populateValidParams(params)
        def checklistItem = new ChecklistItem(params)

        assert checklistItem.save() != null

        params.id = checklistItem.id

        def model = controller.edit()

        assert model.checklistItemInstance == checklistItem
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/checklistItem/list'

        response.reset()


        populateValidParams(params)
        def checklistItem = new ChecklistItem(params)

        assert checklistItem.save() != null

        // test invalid parameters in update
        params.id = checklistItem.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/checklistItem/edit"
        assert model.checklistItemInstance != null

        checklistItem.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/checklistItem/show/$checklistItem.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        checklistItem.clearErrors()

        populateValidParams(params)
        params.id = checklistItem.id
        params.version = -1
        controller.update()

        assert view == "/checklistItem/edit"
        assert model.checklistItemInstance != null
        assert model.checklistItemInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/checklistItem/list'

        response.reset()

        populateValidParams(params)
        def checklistItem = new ChecklistItem(params)

        assert checklistItem.save() != null
        assert ChecklistItem.count() == 1

        params.id = checklistItem.id

        controller.delete()

        assert ChecklistItem.count() == 0
        assert ChecklistItem.get(checklistItem.id) == null
        assert response.redirectedUrl == '/checklistItem/list'
    }
}
