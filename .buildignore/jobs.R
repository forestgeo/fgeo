
# Interactive
# devtools::check_win_devel()
# rhub::validate_email()
ck_remote <- devtools::check(remote = TRUE)
ck_cran <- rhub::check_for_cran()
ck_macos <- rhub::check_on_macos()
ck_fedora_cd <- rhub::check(platform = "fedora-clang-devel")
ck_fedora_gd <- rhub::check(platform = "fedora-gcc-devel")
ck_solaris <- rhub::check_on_solaris()

# If has compiled code
# rhub::check(platform = 'ubuntu-rchk')
# rhub::check_with_sanitizers()
