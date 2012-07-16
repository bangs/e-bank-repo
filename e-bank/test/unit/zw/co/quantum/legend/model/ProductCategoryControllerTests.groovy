package zw.co.quantum.legend.model



import org.junit.*
import grails.test.mixin.*

@TestFor(ProductCategoryController)
@Mock(ProductCategory)
class ProductCategoryControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/productCategory/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.productCategoryInstanceList.size() == 0
        assert model.productCategoryInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.productCategoryInstance != null
    }

    void testSave() {
        controller.save()

        assert model.productCategoryInstance != null
        assert view == '/productCategory/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/productCategory/show/1'
        assert controller.flash.message != null
        assert ProductCategory.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/productCategory/list'


        populateValidParams(params)
        def productCategory = new ProductCategory(params)

        assert productCategory.save() != null

        params.id = productCategory.id

        def model = controller.show()

        assert model.productCategoryInstance == productCategory
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/productCategory/list'


        populateValidParams(params)
        def productCategory = new ProductCategory(params)

        assert productCategory.save() != null

        params.id = productCategory.id

        def model = controller.edit()

        assert model.productCategoryInstance == productCategory
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/productCategory/list'

        response.reset()


        populateValidParams(params)
        def productCategory = new ProductCategory(params)

        assert productCategory.save() != null

        // test invalid parameters in update
        params.id = productCategory.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/productCategory/edit"
        assert model.productCategoryInstance != null

        productCategory.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/productCategory/show/$productCategory.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        productCategory.clearErrors()

        populateValidParams(params)
        params.id = productCategory.id
        params.version = -1
        controller.update()

        assert view == "/productCategory/edit"
        assert model.productCategoryInstance != null
        assert model.productCategoryInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/productCategory/list'

        response.reset()

        populateValidParams(params)
        def productCategory = new ProductCategory(params)

        assert productCategory.save() != null
        assert ProductCategory.count() == 1

        params.id = productCategory.id

        controller.delete()

        assert ProductCategory.count() == 0
        assert ProductCategory.get(productCategory.id) == null
        assert response.redirectedUrl == '/productCategory/list'
    }
}
