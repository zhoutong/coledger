angular.module("coledger").directive "transactionsComments", ['Resources', 'CurrentUser', 'flash', '$modal', (Resources, CurrentUser, flash, $modal) ->
  restrict: 'E'
  templateUrl: 'transactions/comments.html'
  scope: true
  link: (scope, element, attrs) ->
    scope.comments = []
    scope.comment = {}
    scope.limit = 3

    scope.currentUser = CurrentUser.get()

    scope.refreshComments = ->
      scope.comments = Resources.Comment.query(scope.transactionParams)

    scope.createComment = (form) ->
      Resources.Comment.save scope.transactionParams, scope.comment, (success) ->
        flash.success = "Comment has been posted."
        scope.comment = {}
        scope.refreshComments()
        scope.showAll()

    scope.showAll = ->
      scope.comments.$promise.then ->
        scope.limit = scope.comments.length

    scope.refreshComments()

]
