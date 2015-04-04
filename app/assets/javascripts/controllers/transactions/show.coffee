angular.module("coledger").controller("TransactionsShowController", ['$scope', '$modalInstance', 'flash', 'Resources', 'transaction', 'project', 'account'
  ($scope, $modalInstance, flash, Resources, transaction, project, account) ->
    $scope.transaction = transaction
    $scope.updateTransaction = ->
      Resources.Transaction.update { project_id: project.id, account_id: account.id, id: transaction.id }, $scope.transaction, (success) ->
        flash.success = "Transaction has been saved."
      , (failure) ->
        flash.error = "Transaction cannot be saved due to an error."
    $scope.cancel = ->
      $modalInstance.dismiss('cancel')
])
