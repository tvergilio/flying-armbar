package classplanner

class SecurityFilters {

    def filters = {
        all(controller: '*', action: '*') {
            before = {

            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
        doLogin(controller: '*', action: '*') {
            before = {
                if (!controllerName)
                    return true
                def allowedActions = ['show', 'index', 'login',
                                      'validate', 'search']
                if (!session.user && !allowedActions.contains(actionName)) {
                    redirect(controller: 'User', action: 'login',
                            params: ['cName': controllerName,
                                     'aName': actionName])
                    return false
                }
            }
        }
    }
}