import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
  }) =>
      [enText, esText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // auth_Login
  {
    'mj79bm94': {
      'en': 'Welcome Back!',
      'es': '',
    },
    'gg063s62': {
      'en': 'Use the form below to access your account.',
      'es': '',
    },
    '3n2w8fq9': {
      'en': 'Email Address',
      'es': '',
    },
    '2yd3xdiq': {
      'en': 'Enter your email here...',
      'es': '',
    },
    '0im7y9js': {
      'en': 'Password',
      'es': '',
    },
    'cs2c4y76': {
      'en': 'Enter your password here...',
      'es': '',
    },
    'irfkf7mh': {
      'en': 'Forgot Password?',
      'es': '',
    },
    'hqvou68t': {
      'en': 'Login',
      'es': '',
    },
    'nfw60hr0': {
      'en': 'Use a social platform to continue',
      'es': '',
    },
    '7fqkkd5g': {
      'en': 'Don\'t have an account?',
      'es': '',
    },
    'dcvontdk': {
      'en': 'Create Account',
      'es': '',
    },
    'u8fk7lrq': {
      'en': 'Field is required',
      'es': '',
    },
    '4lovthkx': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
    },
    'c7hm85n1': {
      'en': 'Field is required',
      'es': '',
    },
    '9vxrpe2s': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
    },
    '0n0e7a13': {
      'en': 'Home',
      'es': '',
    },
  },
  // forgotPassword
  {
    'y7luv9g2': {
      'en': 'Forgot Password',
      'es': '',
    },
    '100lm3ks': {
      'en':
          'Don\'t remember your password? Enter the email associated with your account below and we will send you a new link.',
      'es': '',
    },
    'qkcs0kzf': {
      'en': 'Email Address',
      'es': '',
    },
    'i4u9j7df': {
      'en': 'Please enter a valid email...',
      'es': '',
    },
    'hiidfxw3': {
      'en': 'Send Reset Link',
      'es': '',
    },
    '9v3x2dll': {
      'en': 'Home',
      'es': '',
    },
  },
  // auth_Create
  {
    'at67gqju': {
      'en': 'Get Started',
      'es': '',
    },
    '6pykb9t5': {
      'en': 'Use the form below to get started.',
      'es': '',
    },
    'mr9es1dy': {
      'en': 'Display Name',
      'es': '',
    },
    'dpdu926m': {
      'en': 'Enter your display name here...',
      'es': '',
    },
    'jvu33y1i': {
      'en': 'Email Address',
      'es': '',
    },
    'ubwfelpx': {
      'en': 'Enter your email here...',
      'es': '',
    },
    '0971f6wq': {
      'en': 'Location',
      'es': '',
    },
    'uwa2h99a': {
      'en': 'Enter your address here...',
      'es': '',
    },
    'mp8k1hbl': {
      'en': '',
      'es': '',
    },
    '84k98240': {
      'en': 'Locate Me',
      'es': '',
    },
    '2to48i0t': {
      'en': 'Password',
      'es': '',
    },
    '35uvrbe9': {
      'en': 'Create your password...',
      'es': '',
    },
    'xwv5ma30': {
      'en': 'Confirm Password',
      'es': '',
    },
    'citfyb8l': {
      'en': 'Create your password...',
      'es': '',
    },
    '8vmie2zm': {
      'en': 'Create Account',
      'es': '',
    },
    'dyom2b6w': {
      'en': 'Use a social platform to continue',
      'es': '',
    },
    'q73d2f76': {
      'en': 'Already have an account?',
      'es': '',
    },
    '49yype1w': {
      'en': 'Log In',
      'es': '',
    },
    'xattkp1z': {
      'en': 'Home',
      'es': '',
    },
  },
  // Main_Home
  {
    'nic1uaq9': {
      'en': 'Dashboard',
      'es': '',
    },
    '25zn1o84': {
      'en': 'Your slice of democracy below',
      'es': '',
    },
    '3svom58g': {
      'en': 'Election Days',
      'es': '',
    },
    'k2cfi9sv': {
      'en': 'Tuesday, May 14',
      'es': '',
    },
    's7mpn0il': {
      'en': 'Tuesday, Nov 5',
      'es': '',
    },
    'l73wi08f': {
      'en': 'Tuesday, May 14',
      'es': '',
    },
    'toh6t86r': {
      'en': 'Tuesday, Nov 5',
      'es': '',
    },
    'i7h2gbsc': {
      'en': 'Followed Candidates',
      'es': '',
    },
    '7bk882nf': {
      'en': '__',
      'es': '',
    },
  },
  // Main_officersList
  {
    'oh741gy4': {
      'en': 'Officials',
      'es': '',
    },
    '9z3tyns9': {
      'en': 'All',
      'es': '',
    },
    'wzsmwp5g': {
      'en': 'Name',
      'es': '',
    },
    'stam6ax0': {
      'en': 'Title',
      'es': '',
    },
    'g299fb6p': {
      'en': 'Company',
      'es': '',
    },
    'a0w1ddqv': {
      'en': 'Company',
      'es': '',
    },
    '006xsn27': {
      'en': 'Status',
      'es': '',
    },
    'dj4rlcn8': {
      'en': 'Federal',
      'es': '',
    },
    '6gizxlk9': {
      'en': 'Name',
      'es': '',
    },
    'koiu5xal': {
      'en': 'Title',
      'es': '',
    },
    '22rbk02f': {
      'en': 'Company',
      'es': '',
    },
    'jphmvkxe': {
      'en': 'Company',
      'es': '',
    },
    'fi4642q1': {
      'en': 'Status',
      'es': '',
    },
    'qo34v1p7': {
      'en': 'State',
      'es': '',
    },
    '3xajex21': {
      'en': 'Name',
      'es': '',
    },
    'bj8ileqn': {
      'en': 'Title',
      'es': '',
    },
    'rmg2ji16': {
      'en': 'Company',
      'es': '',
    },
    'w6lu3cpa': {
      'en': 'Company',
      'es': '',
    },
    'e4bnyoye': {
      'en': 'Status',
      'es': '',
    },
    '9ixh5dij': {
      'en': 'Local',
      'es': '',
    },
    'qzqr3p5b': {
      'en': 'Name',
      'es': '',
    },
    'x3thp0rx': {
      'en': 'Title',
      'es': '',
    },
    'xdikqgi2': {
      'en': 'Company',
      'es': '',
    },
    'lk80cfda': {
      'en': 'Company',
      'es': '',
    },
    'nfn3o8el': {
      'en': 'Status',
      'es': '',
    },
    'mcpgnzo2': {
      'en': '__',
      'es': '',
    },
  },
  // Main_ElectionsDeprecated
  {
    '5amahfts': {
      'en': 'Coming Elections',
      'es': '',
    },
    'iz0xtvoy': {
      'en': 'Federal',
      'es': '',
    },
    'nbfaqmn3': {
      'en': 'State',
      'es': '',
    },
    'c62s0dgn': {
      'en': 'Local',
      'es': '',
    },
    'uakc5yfa': {
      'en': 'County: ',
      'es': '',
    },
    'hszftwyb': {
      'en': 'City:',
      'es': '',
    },
    'w4zgt6o6': {
      'en': '__',
      'es': '',
    },
  },
  // Main_Notifications
  {
    '20y5fya1': {
      'en': 'Notifications',
      'es': '',
    },
    'o2kjxspb': {
      'en': 'Randy Mcdonald',
      'es': '',
    },
    'hwemkb66': {
      'en':
          'This was really great, i\'m so glad that we could  catchup this weekend.',
      'es': '',
    },
    'dmoop1a1': {
      'en': 'Mon. July 3rd - 4:12pm',
      'es': '',
    },
    '88i6azgi': {
      'en': 'Randy Mcdonald',
      'es': '',
    },
    '132xnife': {
      'en':
          'This was really great, i\'m so glad that we could  catchup this weekend.',
      'es': '',
    },
    'nzw0p46b': {
      'en': 'Mon. July 3rd - 4:12pm',
      'es': '',
    },
    '3mhi8d0i': {
      'en': 'Randy Mcdonald',
      'es': '',
    },
    '4z0vyai2': {
      'en':
          'This was really great, i\'m so glad that we could  catchup this weekend.',
      'es': '',
    },
    'bv48t1du': {
      'en': 'Mon. July 3rd - 4:12pm',
      'es': '',
    },
    'uwywpo8o': {
      'en':
          'I am a freelancer and I need help writing content for a proposal for a project. Can I give you some context for the projecct I need to write a proposal for?',
      'es': '',
    },
    '53bnovzs': {
      'en': 'Just Now',
      'es': '',
    },
    'qu42yy0a': {
      'en': 'Hey really love what you are doing!',
      'es': '',
    },
    'j3fcocs2': {
      'en': 'a few moments ago',
      'es': '',
    },
    'owic66mo': {
      'en': 'This is my intro video',
      'es': '',
    },
    'yb02wsqt': {
      'en': 'Just Now',
      'es': '',
    },
    '0jg3oeid': {
      'en': 'Hey really love what you are doing!',
      'es': '',
    },
    '9chp6p0e': {
      'en': 'Just Now',
      'es': '',
    },
    'ycqro7rl': {
      'en': 'Hey really love what you are doing!',
      'es': '',
    },
    '6aufdabf': {
      'en': 'Just Now',
      'es': '',
    },
    'sx0kgyjj': {
      'en': 'Start typing here...',
      'es': '',
    },
    'ykfvkyh5': {
      'en': '__',
      'es': '',
    },
  },
  // Main_profilePage
  {
    '76m9acui': {
      'en': 'My Profile',
      'es': '',
    },
    'zpgzl7l0': {
      'en': 'Account Settings',
      'es': '',
    },
    'dgnahgv7': {
      'en': 'Change Password',
      'es': '',
    },
    'b0hlhry6': {
      'en': 'Edit Profile',
      'es': '',
    },
    '21vvpmq9': {
      'en': 'Update Theme',
      'es': '',
    },
    'q48rtpyl': {
      'en':
          'Update the theme of your application from seleccting one of the options below.',
      'es': '',
    },
    'w28fpx2f': {
      'en': 'Dark Mode',
      'es': '',
    },
    'urswnv4u': {
      'en': 'Light Mode',
      'es': '',
    },
    '9mgpgsqc': {
      'en': 'Log Out',
      'es': '',
    },
    'upq08dak': {
      'en': '__',
      'es': '',
    },
  },
  // editProfile
  {
    'cwrb26fv': {
      'en': 'Change Photo',
      'es': '',
    },
    'qsqp5yng': {
      'en': 'Your Name',
      'es': '',
    },
    '3egp5bqh': {
      'en': 'The email associated with this account is:',
      'es': '',
    },
    'n582pk8w': {
      'en': 'Save Changes',
      'es': '',
    },
    '221vivo7': {
      'en': 'Delete Account',
      'es': '',
    },
    '1amqfmbj': {
      'en': 'Manage Profile',
      'es': '',
    },
  },
  // candidateDetails
  {
    'snz2qxif': {
      'en': 'Running For:',
      'es': '',
    },
    'fy2wnkfw': {
      'en': 'About',
      'es': '',
    },
    'vd4p2m5x': {
      'en': 'Committee:',
      'es': '',
    },
    'avlgqpfp': {
      'en': 'Bio',
      'es': '',
    },
    'ahxy6arh': {
      'en': ' Policies',
      'es': '',
    },
    'ucc69fbm': {
      'en': 'Media',
      'es': '',
    },
    'bqsjaycf': {
      'en': 'No Media',
      'es': '',
    },
    'a2ge0gb9': {
      'en': 'Posts',
      'es': '',
    },
    '0w66q6em': {
      'en': 'Go to Donation Page',
      'es': '',
    },
    'fgb6t3hb': {
      'en': 'Home',
      'es': '',
    },
  },
  // electionPage
  {
    'lxiuzu22': {
      'en': 'Incumbents:',
      'es': '',
    },
    'r25m9hmo': {
      'en': 'Party / Affiliation',
      'es': '',
    },
    'k40o6v2u': {
      'en': 'None',
      'es': '',
    },
    'fmq7h1qn': {
      'en': 'Democratic Party',
      'es': '',
    },
    'fhvddw5q': {
      'en': 'Republican Party',
      'es': '',
    },
    'injwqpt0': {
      'en': 'Independent',
      'es': '',
    },
    'gchk6cc2': {
      'en': 'Other',
      'es': '',
    },
    '478en5v7': {
      'en': 'Unaffiliated',
      'es': '',
    },
    'e1eb7t85': {
      'en': 'None',
      'es': '',
    },
    'zos71wx5': {
      'en': 'Select Party...',
      'es': '',
    },
    'yifa4k3q': {
      'en': 'Search for an item...',
      'es': '',
    },
    'ge9q0zti': {
      'en': 'Home',
      'es': '',
    },
  },
  // createCandidate
  {
    '8fsr89oz': {
      'en': 'Stages',
      'es': '',
    },
    'le1p9lfj': {
      'en': 'Campaign',
      'es': '',
    },
    'mfwmtwyz': {
      'en': 'Candidate',
      'es': '',
    },
    'eoaa1mg5': {
      'en': 'Social Media ',
      'es': '',
    },
    'e8n1ml4g': {
      'en': 'Issues and Policies',
      'es': '',
    },
    'z2rj9dp9': {
      'en': 'Donations',
      'es': '',
    },
    'owrrpkfm': {
      'en': 'Complete',
      'es': '',
    },
    'yhkd5cis': {
      'en': 'Campaign Details',
      'es': '',
    },
    '30exjtcj': {
      'en': 'Display Name',
      'es': '',
    },
    'vyldvalf': {
      'en': 'Eg. George Washington',
      'es': '',
    },
    'nbu67jnw': {
      'en': 'Committe Name',
      'es': '',
    },
    'nys258pa': {
      'en': 'Eg. Friends of  Washington',
      'es': '',
    },
    'bdjlb9db': {
      'en': 'Campaign Email',
      'es': '',
    },
    '9ji87bux': {
      'en': 'Eg. info@washington1782.com',
      'es': '',
    },
    'dtcx0pjl': {
      'en': 'Campaign Phone',
      'es': '',
    },
    'r5vjqxxb': {
      'en': 'Eg. (123) 456 - 1776',
      'es': '',
    },
    'mu3b9m40': {
      'en': 'Select Governance...',
      'es': '',
    },
    '9f0rookl': {
      'en': 'Search for an item...',
      'es': '',
    },
    'd0uykgci': {
      'en': 'Jurisdiction',
      'es': '',
    },
    'iyr729bi': {
      'en': 'City',
      'es': '',
    },
    '9zcgc03h': {
      'en': '',
      'es': '',
    },
    'jxtr16nc': {
      'en': 'County',
      'es': '',
    },
    '3kuw2y9r': {
      'en': '',
      'es': '',
    },
    'uihgygbk': {
      'en': 'Federal District Number',
      'es': '',
    },
    '5aqr5019': {
      'en': '1',
      'es': '',
    },
    'dm2luyw5': {
      'en': 'Maryland',
      'es': '',
    },
    'ycaviglg': {
      'en': 'Select State...',
      'es': '',
    },
    '61wbu1wp': {
      'en': 'Search for an item...',
      'es': '',
    },
    '720ox167': {
      'en': 'Locate',
      'es': '',
    },
    's0uk4k1d': {
      'en': 'Party',
      'es': '',
    },
    'soxd4wsw': {
      'en': 'Democratic Party',
      'es': '',
    },
    '1mdb7024': {
      'en': 'Republican Party',
      'es': '',
    },
    '5bltovym': {
      'en': 'Independent',
      'es': '',
    },
    't94yafgb': {
      'en': 'Other',
      'es': '',
    },
    'itx2k73y': {
      'en': 'Unaffiliated',
      'es': '',
    },
    'pfgj2n93': {
      'en': 'Select Party...',
      'es': '',
    },
    'rbu29dhs': {
      'en': 'Search for an item...',
      'es': '',
    },
    '63pb01sh': {
      'en': 'Affiliation',
      'es': '',
    },
    'a5d9iemb': {
      'en': 'Eg. Libertarian Party',
      'es': '',
    },
    'vsbvbntb': {
      'en': 'Next',
      'es': '',
    },
    'yjgrr0jr': {
      'en': 'Candidate Details',
      'es': '',
    },
    'vbste4y8': {
      'en': 'Media',
      'es': '',
    },
    'h8w1mk8z': {
      'en': 'About',
      'es': '',
    },
    'vrtjip7r': {
      'en': 'Biography',
      'es': '',
    },
    'cwoi8vk3': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi accumsan metus vitae vehicula pretium. Sed non nulla ac nulla rutrum tempor et non leo. Curabitur accumsan eleifend orci, at congue neque sagittis non. Donec commodo faucibus euismod. Fusce et mi eu lacus laoreet fringilla. Aliquam mollis auctor cursus. Suspendisse mauris nisi, sodales vel venenatis nec, porta eget turpis.\n\nQuisque in est lorem. Suspendisse feugiat gravida magna. In sit amet tellus eros. Morbi consequat nisi tortor, ac sagittis nulla bibendum blandit. Fusce aliquet elementum turpis, ac dictum felis blandit ut. Nulla tincidunt tincidunt scelerisque. Nunc molestie libero ut diam aliquet, a vulputate augue porttitor. Mauris quis mauris id ipsum ultrices facilisis et eu purus. Proin blandit sagittis massa, consequat auctor neque convallis quis. Praesent tempor sit amet felis eu aliquet. Vestibulum mattis lorem a nisl tristique condimentum. Vestibulum a massa iaculis, elementum purus ac, volutpat nunc. Cras tellus quam, placerat ornare diam et, efficitur sagittis tellus.\n\nSed in est at mauris ultricies pellentesque. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis feugiat viverra maximus. Vestibulum tincidunt urna id luctus congue. Cras diam sapien, pulvinar ut lacinia sed, ultrices vel libero. Cras porttitor est vitae massa dictum mattis quis sit amet nibh. Sed id congue leo, quis hendrerit ipsum. In tristique metus magna, eget viverra dui auctor eget. Quisque commodo tortor quis commodo bibendum. Cras et tempus felis. Donec tristique luctus sem eu euismod. Aliquam at augue diam.\n\nPraesent ornare malesuada velit in accumsan. Phasellus posuere risus leo, in venenatis arcu mattis ut. Nam orci velit, gravida eget lacus sit amet, venenatis pellentesque arcu. Phasellus porttitor, tortor et pellentesque pulvinar, diam velit tincidunt dui, non fringilla turpis diam id massa. Donec viverra arcu justo, in tincidunt magna consectetur ac. Aenean elementum libero eu purus maximus pulvinar. Aenean cursus dolor mauris, sed aliquet mauris porta ac. Duis laoreet quam libero, quis varius odio bibendum sit amet. Nullam tincidunt auctor arcu id facilisis. Donec fringilla erat mauris, non sodales massa cursus nec. Nam pharetra lectus eu libero rutrum vestibulum. Morbi luctus eget sem in gravida. Praesent ac eleifend ex. Aenean ornare, risus at porta bibendum, ligula neque posuere dolor, quis laoreet velit justo ac est. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.\n\nCurabitur malesuada commodo velit sed dictum. Phasellus consequat tellus suscipit velit aliquet, ut convallis nibh tempus. Donec auctor ex quis lobortis commodo. Ut vitae tincidunt erat. Maecenas porta sodales varius. Pellentesque cursus elit suscipit nulla fermentum, a rutrum neque dapibus. Nulla diam sapien, dignissim eget vehicula ut, facilisis sed diam. Nulla at justo vitae magna sollicitudin accumsan. Morbi quis erat quis quam convallis posuere lobortis vel velit. Phasellus facilisis venenatis sem, ac tempus enim tempus id. Nulla porta quam et congue fermentum. Fusce nibh sem, venenatis et sem ut, iaculis tristique sem. Vivamus porttitor vitae tortor eu accumsan. Aenean cursus non augue at ullamcorper.',
      'es': '',
    },
    'gjle8cyj': {
      'en': 'Next',
      'es': '',
    },
    'i2lu1ksm': {
      'en': 'Social Media',
      'es': '',
    },
    'g7ntejy3': {
      'en': 'Publish your online presence - ',
      'es': '',
    },
    'bhclhems': {
      'en': 'Not required',
      'es': '',
    },
    'bpsbrdu3': {
      'en': 'Website',
      'es': '',
    },
    't3a2se6a': {
      'en': 'Enter your Website url...',
      'es': '',
    },
    'ioq94y9g': {
      'en': 'Twitter',
      'es': '',
    },
    'oaujj2r6': {
      'en': 'Enter your Twitter url...',
      'es': '',
    },
    'b1pi3gqv': {
      'en': 'Instagram',
      'es': '',
    },
    'zxxftrqj': {
      'en': 'Enter your Instagram url...',
      'es': '',
    },
    'zjhoc62m': {
      'en': 'Facebook',
      'es': '',
    },
    'yq1tqixu': {
      'en': 'Enter your Facebook url...',
      'es': '',
    },
    'ggczhpi9': {
      'en': 'Snapchat',
      'es': '',
    },
    'jpcnljjw': {
      'en': 'Enter your Snapchat url...',
      'es': '',
    },
    'ntmrlyaq': {
      'en': 'Next',
      'es': '',
    },
    'l2l39sx6': {
      'en': 'Issues and Policies',
      'es': '',
    },
    'j7hd16md': {
      'en': 'Let us know what you stand for',
      'es': '',
    },
    '6wji9xc5': {
      'en': 'Policies',
      'es': '',
    },
    'p0i8wq3z': {
      'en': 'Label',
      'es': '',
    },
    'mxa3ynqd': {
      'en': 'Freedom of Speech...',
      'es': '',
    },
    '261zyl1q': {
      'en': 'Details',
      'es': '',
    },
    'q10s186g': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi accumsan metus vitae vehicula pretium. Sed non nulla ac nulla rutrum tempor et non leo. Curabitur accumsan eleifend orci, at congue neque sagittis non. Donec commodo faucibus euismod. Fusce et mi eu lacus laoreet fringilla. Aliquam mollis auctor cursus. Suspendisse mauris nisi, sodales vel venenatis nec, porta eget turpis.\n\nQuisque in est lorem. Suspendisse feugiat gravida magna. In sit amet tellus eros. Morbi consequat nisi tortor, ac sagittis nulla bibendum blandit. Fusce aliquet elementum turpis, ac dictum felis blandit ut. Nulla tincidunt tincidunt scelerisque. Nunc molestie libero ut diam aliquet, a vulputate augue porttitor. Mauris quis mauris id ipsum ultrices facilisis et eu purus. Proin blandit sagittis massa, consequat auctor neque convallis quis. Praesent tempor sit amet felis eu aliquet. Vestibulum mattis lorem a nisl tristique condimentum. Vestibulum a massa iaculis, elementum purus ac, volutpat nunc. Cras tellus quam, placerat ornare diam et, efficitur sagittis tellus.\n\nSed in est at mauris ultricies pellentesque. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis feugiat viverra maximus. Vestibulum tincidunt urna id luctus congue. Cras diam sapien, pulvinar ut lacinia sed, ultrices vel libero. Cras porttitor est vitae massa dictum mattis quis sit amet nibh. Sed id congue leo, quis hendrerit ipsum. In tristique metus magna, eget viverra dui auctor eget. Quisque commodo tortor quis commodo bibendum. Cras et tempus felis. Donec tristique luctus sem eu euismod. Aliquam at augue diam.\n\nPraesent ornare malesuada velit in accumsan. Phasellus posuere risus leo, in venenatis arcu mattis ut. Nam orci velit, gravida eget lacus sit amet, venenatis pellentesque arcu. Phasellus porttitor, tortor et pellentesque pulvinar, diam velit tincidunt dui, non fringilla turpis diam id massa. Donec viverra arcu justo, in tincidunt magna consectetur ac. Aenean elementum libero eu purus maximus pulvinar. Aenean cursus dolor mauris, sed aliquet mauris porta ac. Duis laoreet quam libero, quis varius odio bibendum sit amet. Nullam tincidunt auctor arcu id facilisis. Donec fringilla erat mauris, non sodales massa cursus nec. Nam pharetra lectus eu libero rutrum vestibulum. Morbi luctus eget sem in gravida. Praesent ac eleifend ex. Aenean ornare, risus at porta bibendum, ligula neque posuere dolor, quis laoreet velit justo ac est. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.\n\nCurabitur malesuada commodo velit sed dictum. Phasellus consequat tellus suscipit velit aliquet, ut convallis nibh tempus. Donec auctor ex quis lobortis commodo. Ut vitae tincidunt erat. Maecenas porta sodales varius. Pellentesque cursus elit suscipit nulla fermentum, a rutrum neque dapibus. Nulla diam sapien, dignissim eget vehicula ut, facilisis sed diam. Nulla at justo vitae magna sollicitudin accumsan. Morbi quis erat quis quam convallis posuere lobortis vel velit. Phasellus facilisis venenatis sem, ac tempus enim tempus id. Nulla porta quam et congue fermentum. Fusce nibh sem, venenatis et sem ut, iaculis tristique sem. Vivamus porttitor vitae tortor eu accumsan. Aenean cursus non augue at ullamcorper.',
      'es': '',
    },
    'ibgg6104': {
      'en': 'Add Policy',
      'es': '',
    },
    'dll1ljym': {
      'en': 'Details: ',
      'es': '',
    },
    'k8hnun6o': {
      'en':
          'I am a firm supporter of the Constitution in its entirety, including the 2nd Amendment as it is written. I believe that we not only have the right to self-defense, but also the right to bear arms in the face of tyrannical government as our Founding Fathers intended. Gun rights are for all law-abiding citizens and not just for the wealthy or well-connected. I will always fight for your right to protect your family and your property. I will fight against anti-gun misinformation and the relentless attacks on our God-given freedoms by the Biden Administration. ',
      'es': '',
    },
    'sqim845r': {
      'en': 'Next',
      'es': '',
    },
    'nxzep3jc': {
      'en': 'Donation Details',
      'es': '',
    },
    '6r5m58f0': {
      'en': 'Setup Stripe to receive your Campaign contributions',
      'es': '',
    },
    'jfmiail1': {
      'en': 'Existing Stripe Account',
      'es': '',
    },
    '805houcn': {
      'en': 'New Account Information',
      'es': '',
    },
    'ekiscifi': {
      'en': 'Check information',
      'es': '',
    },
    '860b4n1n': {
      'en': 'Campaign Email',
      'es': '',
    },
    'klp9ud0c': {
      'en': 'Eg. info@washington1782.com',
      'es': '',
    },
    'uaedzt17': {
      'en': 'Business Name',
      'es': '',
    },
    '7lkn65bm': {
      'en': 'Eg. (Commitee Name)',
      'es': '',
    },
    'exhe7rxy': {
      'en': 'Phone Number',
      'es': '',
    },
    'wwfuh0q9': {
      'en': 'Eg. info@washington1782.com',
      'es': '',
    },
    '0or0c4uf': {
      'en': 'Non-Profit',
      'es': '',
    },
    '3reho3j7': {
      'en': 'Company',
      'es': '',
    },
    'euot9edd': {
      'en': 'Non-Profit',
      'es': '',
    },
    'w26p6jfn': {
      'en': 'Government',
      'es': '',
    },
    'u6bw5rg8': {
      'en': 'Individual',
      'es': '',
    },
    'hcmgbw0y': {
      'en': 'Select Business Type...',
      'es': '',
    },
    '4b84g42o': {
      'en': 'Search for an item...',
      'es': '',
    },
    '2idiiw1e': {
      'en': 'New Stripe Account',
      'es': '',
    },
    'n4yycnn5': {
      'en': 'Next',
      'es': '',
    },
    '3qua56za': {
      'en': 'Final Look',
      'es': '',
    },
    'q52zvtd7': {
      'en': 'This is what the people will see',
      'es': '',
    },
    '9h8rle9a': {
      'en': 'Candidate Name',
      'es': '',
    },
    'gplqkc0a': {
      'en': 'Running For:',
      'es': '',
    },
    'rlyci2uq': {
      'en': 'Head of Procurement',
      'es': '',
    },
    '8izijd8b': {
      'en': 'About',
      'es': '',
    },
    '2gkxyjtz': {
      'en': 'Committee:',
      'es': '',
    },
    '755pephp': {
      'en': 'Bio',
      'es': '',
    },
    'lc5qvkh8': {
      'en': ' Policies',
      'es': '',
    },
    'tr42f5qv': {
      'en': 'Policies',
      'es': '',
    },
    'xxpmxh1u': {
      'en': 'Media',
      'es': '',
    },
    '14vqvgy3': {
      'en': 'Coming Soon',
      'es': '',
    },
    'nvsj5isa': {
      'en': 'Donate to Candidate',
      'es': '',
    },
    '6jfvtp27': {
      'en': 'Finish',
      'es': '',
    },
    'zy0f3ljp': {
      'en': 'Home',
      'es': '',
    },
  },
  // officerDetails
  {
    'gd6zbda4': {
      'en': 'Position:',
      'es': '',
    },
    'ocufjaf5': {
      'en': 'About',
      'es': '',
    },
    'oojmxnnb': {
      'en': 'Committee:',
      'es': '',
    },
    'g2n0ejrb': {
      'en': 'Bio',
      'es': '',
    },
    'pd8vrj53': {
      'en': ' Policies',
      'es': '',
    },
    '0ul1ypdy': {
      'en': 'Media',
      'es': '',
    },
    '3fdp94lw': {
      'en': 'Coming Soon',
      'es': '',
    },
    'befek4z7': {
      'en': 'Donate to Candidate',
      'es': '',
    },
    '3u64184r': {
      'en': 'Home',
      'es': '',
    },
  },
  // policyDetails
  {
    'esm3xz8z': {
      'en': 'Policy Details',
      'es': '',
    },
    'zjoadlz2': {
      'en': 'Home',
      'es': '',
    },
  },
  // PostDetails
  {
    'iqrnaof7': {
      'en': 'Leave post here...',
      'es': '',
    },
    'fttl5sq2': {
      'en': 'Home',
      'es': '',
    },
  },
  // candidate_Dashboard
  {
    'kr6dqava': {
      'en': 'Below is a summary of your day.',
      'es': '',
    },
    'ndnfvpv7': {
      'en': 'Page Views',
      'es': '',
    },
    'q2893i44': {
      'en': 'Followers',
      'es': '',
    },
    'y9emvfvm': {
      'en': 'Donation Clicks',
      'es': '',
    },
    '1tk5y45x': {
      'en': 'Latest Posts',
      'es': '',
    },
    'uq5coclq': {
      'en': 'A summary of your last post',
      'es': '',
    },
    'fvn09y2t': {
      'en': 'Recent Activity',
      'es': '',
    },
    'tb57rr6v': {
      'en': 'Below is an overview of tasks & activity completed.',
      'es': '',
    },
    '5s295hic': {
      'en': 'Tasks',
      'es': '',
    },
    'y2q3t77k': {
      'en': 'Completed',
      'es': '',
    },
    '947mdr30': {
      'en': 'Launches',
      'es': '',
    },
    '7s8k5irx': {
      'en': 'Last 30 Days',
      'es': '',
    },
    '1l3jgzhp': {
      'en': 'Avg. Grade',
      'es': '',
    },
    '4vo99hot': {
      'en': 'Dashboard',
      'es': '',
    },
    '1dnssjri': {
      'en': 'Dashboard',
      'es': '',
    },
  },
  // Main_Elections
  {
    'qy4e304l': {
      'en': 'Coming Elections',
      'es': '',
    },
    's9mmkpcz': {
      'en': 'MD',
      'es': '',
    },
    'aw1zj3mr': {
      'en': 'MD',
      'es': '',
    },
    '1kv6xwzo': {
      'en': 'State',
      'es': '',
    },
    '4vttiaxk': {
      'en': 'Search for an item...',
      'es': '',
    },
    '91fxazgy': {
      'en': '1st',
      'es': '',
    },
    'xduyzpq4': {
      'en': '2nd',
      'es': '',
    },
    '2xlz5tzf': {
      'en': '3rd',
      'es': '',
    },
    'c9assyd5': {
      'en': '4th',
      'es': '',
    },
    'gsl2fpb3': {
      'en': '5th',
      'es': '',
    },
    'mv28we7m': {
      'en': '6th',
      'es': '',
    },
    'pold12y4': {
      'en': '7th',
      'es': '',
    },
    'ict1cvj8': {
      'en': '8th',
      'es': '',
    },
    '5xrbln8n': {
      'en': 'All',
      'es': '',
    },
    '2ia9vbft': {
      'en': 'District',
      'es': '',
    },
    's0kr5hy3': {
      'en': 'Search for an item...',
      'es': '',
    },
    'pk8fyb1r': {
      'en': 'All',
      'es': '',
    },
    '3wvttao5': {
      'en': 'County',
      'es': '',
    },
    '6lawhu4j': {
      'en': 'Search for an item...',
      'es': '',
    },
    'rxb5lyum': {
      'en': 'All',
      'es': '',
    },
    '123g7ku6': {
      'en': 'Baltimore',
      'es': '',
    },
    '4i4ky507': {
      'en': 'All',
      'es': '',
    },
    '2xmp69rt': {
      'en': 'City',
      'es': '',
    },
    'um8fgh03': {
      'en': 'Search for an item...',
      'es': '',
    },
    '91y7aw8m': {
      'en': '__',
      'es': '',
    },
  },
  // modal_success
  {
    'qec8w9ic': {
      'en': 'Send Contract Confirmation',
      'es': '',
    },
    '4tqukibx': {
      'en': 'A new contract has been generated for:',
      'es': '',
    },
    '0kl3odsr': {
      'en': 'Randy Alcorn',
      'es': '',
    },
    '8xl1o8lc': {
      'en': 'Head of Procurement',
      'es': '',
    },
    'xe1wtgpw': {
      'en': 'ACME Co.',
      'es': '',
    },
    '35sozf7g': {
      'en': 'Next Steps',
      'es': '',
    },
    'q14g2v0j': {
      'en':
          'Send the information below. And we will send an email with details to the customer and allow you to manage it in your dashboard.',
      'es': '',
    },
    '3yq4196l': {
      'en': 'Send Information',
      'es': '',
    },
    '1sgem00g': {
      'en': 'Never Mind',
      'es': '',
    },
  },
  // modal_Message
  {
    'gipu5mix': {
      'en': 'Congratulations!',
      'es': '',
    },
    'q5y7zkl2': {
      'en':
          'Now that a contract has been generated for this customer please contact them with the date you will send the signed agreement.',
      'es': '',
    },
    'eetkdwm0': {
      'en': 'Okay',
      'es': '',
    },
    'b2c5seze': {
      'en': 'Continue',
      'es': '',
    },
  },
  // modal_Onboarding
  {
    'i5ypg8bn': {
      'en': 'Welcome!',
      'es': '',
    },
    'adzuwpih': {
      'en': 'To democracy in your pocket',
      'es': '',
    },
    '162wi1bu': {
      'en': 'Continue',
      'es': '',
    },
    '8u3b4gqx': {
      'en': 'Setup Your Jurisdiction',
      'es': '',
    },
    'ryggc8cu': {
      'en': 'Focus on your politics at all levels',
      'es': '',
    },
    'fa413sii': {
      'en': '*Note: We don\'t save this data in the cloud',
      'es': '',
    },
    'hfo9o8nc': {
      'en': 'City',
      'es': '',
    },
    '9oyvo6uo': {
      'en': '',
      'es': '',
    },
    'tgoldzft': {
      'en': 'County',
      'es': '',
    },
    'zkc3suhz': {
      'en': '',
      'es': '',
    },
    'al3n3yr6': {
      'en': 'District',
      'es': '',
    },
    'h02stygr': {
      'en': '',
      'es': '',
    },
    '7rtmj0of': {
      'en': 'Maryland',
      'es': '',
    },
    '78vv11zq': {
      'en': 'Select State...',
      'es': '',
    },
    'n9rqlkel': {
      'en': 'Search for an item...',
      'es': '',
    },
    'frsj0854': {
      'en': 'Back',
      'es': '',
    },
    'uwjjnwoo': {
      'en': 'Continue',
      'es': '',
    },
    'v54sstir': {
      'en': 'Done',
      'es': '',
    },
    '6zi1a9p4': {
      'en': 'Welcome to the Republix!!',
      'es': '',
    },
    'vx18vyit': {
      'en': 'Complete',
      'es': '',
    },
  },
  // createComment
  {
    'acfevx1j': {
      'en': 'Create Note',
      'es': '',
    },
    'le2p48y9': {
      'en': 'Find members by searching below',
      'es': '',
    },
    '12dqtiff': {
      'en': 'Ricky Rodriguez',
      'es': '',
    },
    'yvmubogg': {
      'en': 'Enter your note here...',
      'es': '',
    },
    'n88xiito': {
      'en': 'Create Note',
      'es': '',
    },
  },
  // mobileNav
  {
    '9d74wayv': {
      'en': 'Dashboard',
      'es': '',
    },
    'l9f5f825': {
      'en': 'My Team',
      'es': '',
    },
    '4nqfrrgf': {
      'en': 'Customers',
      'es': '',
    },
    '5x5i7q8m': {
      'en': 'Contracts',
      'es': '',
    },
    'gp1j5caf': {
      'en': 'Profile',
      'es': '',
    },
  },
  // webNav
  {
    '2rqutu6f': {
      'en': 'Dashboard',
      'es': '',
    },
    '3nhqpa85': {
      'en': 'Politicians',
      'es': '',
    },
    'g55qzt5g': {
      'en': 'Elections',
      'es': '',
    },
    '8pmlpyhe': {
      'en': 'Messages',
      'es': '',
    },
    'y2siaqfy': {
      'en': 'Profile',
      'es': '',
    },
  },
  // editProfilePhoto
  {
    'z68c7zj4': {
      'en': 'Change Photo',
      'es': '',
    },
    '673jugkq': {
      'en':
          'Upload a new photo below in order to change your avatar seen by others.',
      'es': '',
    },
    '6ihqk64v': {
      'en': 'Upload Image',
      'es': '',
    },
    'je5k3vpe': {
      'en': 'Save Changes',
      'es': '',
    },
  },
  // dropdown_PostEdit
  {
    '7bef1pr2': {
      'en': 'Options',
      'es': '',
    },
    'k3k8ba1y': {
      'en': 'Share',
      'es': '',
    },
    '2yvp4unq': {
      'en': 'Edit',
      'es': '',
    },
    'aypcenbp': {
      'en': 'Delete',
      'es': '',
    },
  },
  // modal_profile_Edit
  {
    '7ob4wbv3': {
      'en': 'Edit Profile',
      'es': '',
    },
    'gp63t4wk': {
      'en': 'Below are your profile details',
      'es': '',
    },
    'r9hn1eyi': {
      'en': 'Change Photo',
      'es': '',
    },
    'g3155w0j': {
      'en': 'Your Name',
      'es': '',
    },
    '1c4eq3gc': {
      'en': 'Short Description',
      'es': '',
    },
    '449xi9eb': {
      'en': 'Admin',
      'es': '',
    },
    'k15ie34c': {
      'en': 'Admin',
      'es': '',
    },
    'h4whre1v': {
      'en': 'Manager',
      'es': '',
    },
    'ow1oig24': {
      'en': 'Editor',
      'es': '',
    },
    'ly7y3ibu': {
      'en': 'Viewer',
      'es': '',
    },
    'pojzavsd': {
      'en': 'Please select...',
      'es': '',
    },
    '0s1bdg6u': {
      'en': 'Search for an item...',
      'es': '',
    },
    '3jzvt6q5': {
      'en': 'The email associated with this account is:',
      'es': '',
    },
    '8of7xk52': {
      'en': 'casper@ghostbusters.com',
      'es': '',
    },
    '8xz2xuo0': {
      'en': 'Created On:',
      'es': '',
    },
    '2fta9qk8': {
      'en': 'July 12th, 2023',
      'es': '',
    },
    'tnpvn02b': {
      'en': 'Last Active:',
      'es': '',
    },
    't3how5ka': {
      'en': 'Just Now',
      'es': '',
    },
    'q9k6ot8a': {
      'en': 'Cancel',
      'es': '',
    },
    'hqokcw4n': {
      'en': 'Save Changes',
      'es': '',
    },
  },
  // OfficerComponent
  {
    'g553nr5d': {
      'en': 'ACME Co.',
      'es': '',
    },
    'a06ims8s': {
      'en': 'ACME Co.',
      'es': '',
    },
    'f5agmqjq': {
      'en': 'Info',
      'es': '',
    },
  },
  // CandidateComponent
  {
    'jkkuidt2': {
      'en': 'ACME Co.',
      'es': '',
    },
    'ulfk95m8': {
      'en': 'ACME Co.',
      'es': '',
    },
  },
  // DonationBottomSheet
  {
    'xcchle95': {
      'en': 'Choose Donation Amount',
      'es': '',
    },
    'z9l1pj92': {
      'en': 'Must be greater than 50 cents',
      'es': '',
    },
    'n6716v08': {
      'en': '\$5',
      'es': '',
    },
    '25tsdy3w': {
      'en': '\$20',
      'es': '',
    },
    '7qreyd9c': {
      'en': '\$100',
      'es': '',
    },
    'qo52lrca': {
      'en': '\$500',
      'es': '',
    },
    'xcp2hjgr': {
      'en': '\$ Custom Amount',
      'es': '',
    },
    'imml1bko': {
      'en': 'Submit Donation',
      'es': '',
    },
    'nrqrc6f1': {
      'en': 'UpRoot takes a 5% processing fee',
      'es': '',
    },
  },
  // JurisdictionUpdate
  {
    'ro1w7fb9': {
      'en': 'Change Jurisdiction',
      'es': '',
    },
    'z1q40x5q': {
      'en': 'County',
      'es': '',
    },
    '09yy26j1': {
      'en': 'Search for an item...',
      'es': '',
    },
    'axt9pbkk': {
      'en': 'Baltimore',
      'es': '',
    },
    'vcwupieb': {
      'en': 'City',
      'es': '',
    },
    'xk7nyfhz': {
      'en': 'Search for an item...',
      'es': '',
    },
    'nycmgbe8': {
      'en': '1st',
      'es': '',
    },
    '2r6in1cf': {
      'en': '2nd',
      'es': '',
    },
    'shxnhn25': {
      'en': '3rd',
      'es': '',
    },
    '02jt5m7x': {
      'en': '4th',
      'es': '',
    },
    '5nls5mzf': {
      'en': '5th',
      'es': '',
    },
    'ehkbd9mh': {
      'en': '6th',
      'es': '',
    },
    'whyokq7g': {
      'en': '7th',
      'es': '',
    },
    'i89p8fnl': {
      'en': '8th',
      'es': '',
    },
    'womdc1uq': {
      'en': 'District',
      'es': '',
    },
    '5ma6m92n': {
      'en': 'Search for an item...',
      'es': '',
    },
    'sjdmeovd': {
      'en': 'Maryland',
      'es': '',
    },
    'w6grg51q': {
      'en': 'Select State...',
      'es': '',
    },
    'cxqaqj7a': {
      'en': 'Search for an item...',
      'es': '',
    },
    '4a3u3b6n': {
      'en': 'Update Jurisdiction',
      'es': '',
    },
  },
  // ElectionFiller
  {
    '0nzy2j3r': {
      'en': 'No Ongoing Elections',
      'es': '',
    },
  },
  // CandidateFilter
  {
    'hkf9zq58': {
      'en': 'Search Candidates...',
      'es': '',
    },
    'te81eu4v': {
      'en': 'Search',
      'es': '',
    },
    'sn4ptshr': {
      'en': 'Parameters',
      'es': '',
    },
    'g3pjtb5u': {
      'en': 'Party / Affiliation',
      'es': '',
    },
    'erq6ju6t': {
      'en': 'None',
      'es': '',
    },
    'jxavv7te': {
      'en': 'Democratic Party',
      'es': '',
    },
    'gwale9u0': {
      'en': 'Republican Party',
      'es': '',
    },
    'xkwmx4xm': {
      'en': 'Independent',
      'es': '',
    },
    '24n2ixo2': {
      'en': 'Other',
      'es': '',
    },
    'j3i7z9j1': {
      'en': 'Unaffiliated',
      'es': '',
    },
    'pemi2fg4': {
      'en': 'None',
      'es': '',
    },
    '80eql876': {
      'en': 'Select Party...',
      'es': '',
    },
    'np8v61bs': {
      'en': 'Search for an item...',
      'es': '',
    },
    'c3ncqess': {
      'en': 'Policy / Issue',
      'es': '',
    },
  },
  // CustomSwitchTile
  {
    'tchj55ih': {
      'en': 'Pro',
      'es': '',
    },
    'fhdot1jf': {
      'en': 'Anti',
      'es': '',
    },
  },
  // PulpitBottomSheet
  {
    'ndmzvozp': {
      'en': 'Pulpit Name',
      'es': '',
    },
    'cm74w631': {
      'en': 'Leave',
      'es': '',
    },
    'hw1t0rb8': {
      'en': 'Name',
      'es': '',
    },
    '0hiw88ut': {
      'en': 'Listener',
      'es': '',
    },
    'fb97lgs7': {
      'en': 'Shelf',
      'es': '',
    },
  },
  // modal_Confirm
  {
    'hom2k943': {
      'en':
          'You will no longer be following this candidate and getting updates on their campaign.',
      'es': '',
    },
    '42tcrm95': {
      'en': 'Cancel',
      'es': '',
    },
    'hhya3y1t': {
      'en': 'Confirm',
      'es': '',
    },
  },
  // modal_DeleteAcc
  {
    'jegsghh1': {
      'en': 'Are you sure you want to delete?',
      'es': '',
    },
    '4rp4axfp': {
      'en':
          'Republix will remove any and all information regarding your account and it cannot be recovered.',
      'es': '',
    },
    '13yrbtjn': {
      'en': 'Cancel',
      'es': '',
    },
    'aapmxmgx': {
      'en': 'Confirm',
      'es': '',
    },
  },
  // PostComment
  {
    'jur6x2ie': {
      'en': '',
      'es': '',
    },
    'fbqhn7g2': {
      'en': 'Leave post here...',
      'es': '',
    },
    'pktz67nk': {
      'en': '',
      'es': '',
    },
    'wnhenhy3': {
      'en': 'Leave reply here...',
      'es': '',
    },
  },
  // dropdown_CommentEdit
  {
    'pj7obili': {
      'en': 'Options',
      'es': '',
    },
    'q222fxl9': {
      'en': 'Share',
      'es': '',
    },
    'kb7h3kc4': {
      'en': 'Edit',
      'es': '',
    },
    'tn4z6prx': {
      'en': 'Delete',
      'es': '',
    },
  },
  // modal_DeleteComm
  {
    '5tlol58l': {
      'en': 'Delete comment?',
      'es': '',
    },
    '1fz3pec5': {
      'en': 'This action is unrecoverable.',
      'es': '',
    },
    '5bz158id': {
      'en': 'Cancel',
      'es': '',
    },
    'hsda70js': {
      'en': 'Confirm',
      'es': '',
    },
  },
  // candidatePost
  {
    '79gswsfu': {
      'en': 'Create Post',
      'es': '',
    },
    'dlyk2sys': {
      'en': 'Take the pulse directly from your base.',
      'es': '',
    },
    '4nogojf2': {
      'en': 'Add Image',
      'es': '',
    },
    '6vkiwp2q': {
      'en': 'Title',
      'es': '',
    },
    '2eugadbq': {
      'en': 'Declaration of...',
      'es': '',
    },
    '18pwrz4z': {
      'en': 'Description',
      'es': '',
    },
    '8rwmw8q5': {
      'en': 'We the people...',
      'es': '',
    },
    '6snkf9je': {
      'en': 'Cancel',
      'es': '',
    },
    'dqzakmnv': {
      'en': 'Post',
      'es': '',
    },
  },
  // userPost
  {
    'sf94wtm7': {
      'en': 'Create Post',
      'es': '',
    },
    '5bgi2ma4': {
      'en': 'Start the conversation yourself.',
      'es': '',
    },
    'h1hi811b': {
      'en': 'Title',
      'es': '',
    },
    'igdanlze': {
      'en': 'Declaration of...',
      'es': '',
    },
    '5w0jmnaf': {
      'en': 'Description',
      'es': '',
    },
    'y80toht2': {
      'en': 'We the people...',
      'es': '',
    },
    'sdsfb69t': {
      'en': 'Cancel',
      'es': '',
    },
    'ur03dz7x': {
      'en': 'Post',
      'es': '',
    },
  },
  // Comment
  {
    'n00p2z17': {
      'en': 'likes',
      'es': '',
    },
    'tuukijc1': {
      'en': 'dislikes',
      'es': '',
    },
    't2emfnoj': {
      'en': 'Reply',
      'es': '',
    },
    'vvl9pkuo': {
      'en': 'likes',
      'es': '',
    },
    'rpuq07tn': {
      'en': 'dislikes',
      'es': '',
    },
    'xtsqwhsv': {
      'en': 'Reply',
      'es': '',
    },
  },
  // Miscellaneous
  {
    '0nwoj0kc': {
      'en': 'Email address',
      'es': '',
    },
    'upni203i': {
      'en': 'Password',
      'es': '',
    },
    'x5hsigqw': {
      'en': 'Button',
      'es': '',
    },
    '9wy77t9v': {
      'en': 'Button',
      'es': '',
    },
    'woezzutp': {
      'en': 'Button',
      'es': '',
    },
    '2bj20mi4': {
      'en': 'Button',
      'es': '',
    },
    'oztjr3ws': {
      'en': 'Button',
      'es': '',
    },
    'hc87g50d': {
      'en': 'Button',
      'es': '',
    },
    '8ct6cr3a': {
      'en': 'Button',
      'es': '',
    },
    'e368pegn': {
      'en': 'Button',
      'es': '',
    },
    'yv65a6i5': {
      'en': 'Button',
      'es': '',
    },
    '4r7kaahz': {
      'en': 'Calling',
      'es': '',
    },
    '9zk4wopm': {
      'en': 'Not Called',
      'es': '',
    },
    'xn2fkope': {
      'en': 'Pending Review',
      'es': '',
    },
    'jv85czds': {
      'en': 'Closed',
      'es': '',
    },
    'swt4x372': {
      'en': 'Completed',
      'es': '',
    },
    '5w6ne1dl': {
      'en': 'Please select...',
      'es': '',
    },
    'uhfmgei0': {
      'en': 'Search for an item...',
      'es': '',
    },
    'lted0txl': {
      'en': 'All',
      'es': '',
    },
    'm6iqz668': {
      'en': 'Pending',
      'es': '',
    },
    'x2pvxk5r': {
      'en': 'Completed',
      'es': '',
    },
    'txjoh349': {
      'en': 'Calling',
      'es': '',
    },
    'qube3xir': {
      'en': 'All',
      'es': '',
    },
    'mxalfkji': {
      'en': '50%',
      'es': '',
    },
    'z6o24u9q': {
      'en': 'Notifications',
      'es': '',
    },
    'poegde7v': {
      'en': 'Notifications',
      'es': '',
    },
    'v3vjad01': {
      'en': 'Turn on notifications',
      'es': '',
    },
    'bqjgqich': {
      'en': 'Male',
      'es': '',
    },
    'rzl2h9ar': {
      'en': 'Female',
      'es': '',
    },
    'qtchqf19': {
      'en': 'Other',
      'es': '',
    },
    '82a75t5n': {
      'en': 'Design',
      'es': '',
    },
    'w82xuklg': {
      'en': 'Marketing',
      'es': '',
    },
    '5uiyxwtk': {
      'en': 'Development',
      'es': '',
    },
    '3wjkerx7': {
      'en': 'Management',
      'es': '',
    },
    'p6rgfj1v': {
      'en': 'Operations',
      'es': '',
    },
    'c8uww550': {
      'en': 'Customer Service',
      'es': '',
    },
    '2rhm2suy': {
      'en': 'Design',
      'es': '',
    },
    '4xzw91se': {
      'en': 'Button',
      'es': '',
    },
    'k0nyp568': {
      'en': 'Button',
      'es': '',
    },
    'ajq4c1y3': {
      'en': 'Button',
      'es': '',
    },
    'hxsxj681': {
      'en':
          'In order to upload images (profile), this app may need permission to access the camera',
      'es': '',
    },
    'e7agr7ys': {
      'en':
          'In order to upload images (profile), this app may need permission to access the photo library',
      'es': '',
    },
    'bae8is0v': {
      'en':
          'In order to help find your jurisdiction, this app may need permission to access your location.',
      'es': '',
    },
    'z9jmiue0': {
      'en': 'Location information will be used to find your jurisdiction',
      'es': '',
    },
    '65e2tfs2': {
      'en': '',
      'es': '',
    },
    'ddazihx4': {
      'en': '',
      'es': '',
    },
    'db03cpjj': {
      'en': '',
      'es': '',
    },
    'fdb9078p': {
      'en': '',
      'es': '',
    },
    '80ouzj9q': {
      'en': '',
      'es': '',
    },
    '6rzhptp9': {
      'en': '',
      'es': '',
    },
    'ce8c4ty0': {
      'en': '',
      'es': '',
    },
    'vehuejmn': {
      'en': '',
      'es': '',
    },
    'equu7njl': {
      'en': '',
      'es': '',
    },
    'hif7gn0p': {
      'en': '',
      'es': '',
    },
    'kcvqa08x': {
      'en': '',
      'es': '',
    },
    'dqrzd6sq': {
      'en': '',
      'es': '',
    },
    'dpqtohyf': {
      'en': '',
      'es': '',
    },
    'v01vf71s': {
      'en': '',
      'es': '',
    },
    'gcv6def1': {
      'en': '',
      'es': '',
    },
    'um9es99m': {
      'en': '',
      'es': '',
    },
    'o4enbz4j': {
      'en': '',
      'es': '',
    },
    '8z4tvfh7': {
      'en': '',
      'es': '',
    },
    '2ybzla8x': {
      'en': '',
      'es': '',
    },
    'd1wdf5i1': {
      'en': '',
      'es': '',
    },
    'f4rdu9en': {
      'en': '',
      'es': '',
    },
    '2py80kgi': {
      'en': '',
      'es': '',
    },
    'p6lsrh2a': {
      'en': '',
      'es': '',
    },
    'ne8cclp9': {
      'en': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
