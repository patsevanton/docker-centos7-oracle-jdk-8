Name:           maven-3.3.9
Version:        3.3.9
Release:        1
Summary:        Java project management and project comprehension tool
License:        ASL 2.0
URL:            http://maven.apache.org/
BuildArch:      x86_64
Source0:        http://www-us.apache.org/dist/maven/maven-3/%version/binaries/apache-%name-bin.tar.gz
BuildRequires:  wget

%description
%prep

#wget http://www-us.apache.org/dist/maven/maven-3/%version/binaries/apache-%name-bin.tar.gz
tar -zxf apache-%name-bin.tar.gz

%build

%install

mkdir -p %{buildroot}/opt/%name
mv apache-%name %{buildroot}/opt

%files
/opt/apache-%name

%changelog
