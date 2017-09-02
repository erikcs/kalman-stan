data {
  int T;
  vector[T] Y;
}

parameters {
  real<lower=0> sigmaeta;
  real<lower=0> sigmak;
  vector[T] eta;
  vector[T] w;
}

model {
  sigmaeta ~ normal(0, 1);
  sigmak ~ normal(0, 1);

  w[1] ~ normal(0, 0.1);
  w[2:T] ~ normal(w[1:(T-1)], sigmak);
  eta ~ normal(0, sigmaeta);

  Y ~ normal(w + eta, sigmak + sigmaeta);
}
