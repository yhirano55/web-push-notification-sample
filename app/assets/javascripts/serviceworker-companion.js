if (navigator.serviceWorker) {
  navigator.serviceWorker.register('/serviceworker.js', { scope: './' })
    .then(function(registration) {
      return registration.pushManager.subscribe({userVisibleOnly: true});
    })
    .then(function(subscription) {
      $.post('/api/v1/subscriptions', { subscription: subscription.toJSON() });
    });
}
