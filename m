Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF4E606A329
	for <linux-firmware@archiver.kernel.org>; Wed,  4 Nov 2026 07:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XMmuPSni
Received: by smtp.kernel.org (Postfix)
	id CB3EE1F00919; Wed,  4 Nov 2026 07:32:47 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.14
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1793777567;
	b=wakravU5WpgGVW/VGUoLbGHHidaDgOoit51oPBJ5Y4H1EzNSkmz16q/NaFwmydKgJDq7
	 PqceWsV4l5ZFaa5lvTP3zhEjZNd5fEvgDVIB2RGQtnKeGFWvXidbCsJGYg9uUsSVo6OY8
	 2ZBOoBbw4gDQs6Mg1JydT/O08d0Ad6FMX6zTEh+u5AyzlhiXuJUrw+/ayxKBSynQeEWUk
	 Iu4SG+mYoUpOr9mzc1XUid1xhgvm3gKsE0SK888smFmX1tSRaUiZaYa166kUjT5UfCfZV
	 GVgsDCMdPuEpE69uHVDn9erSrte2zJn+muLGzsVxbzONuVuodCR2iBH3nGWxZIKwLRQ==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793777567;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:From:List-Id:To:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ld-processed:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=uKIX/OujgwsJ5F+O49CWgmmdhe8L9nUpUIZIW7WPmgo=;
	b=Qfj9jy58ZqxPO/Yo3NP6oUXmoeGCSVhVOo++KDQUL7t3jeEY8kzGVE7y65UC9BrY0yZx
	 BvqC/EhcoB5jsYuqj8ovcfPtkNxttg7dtm2mKOrEqxLPqZrpdrrZdSyMkSkx84hrm6NUB
	 N2vpVViHYscQYtrLZzEseWFFs9m5kJWDsODeFL/RsEqC6p4fMEZu2s5WdLPdCFCRLQ/st
	 iucDJwf8YHbbbvT3s2t3ATCWvEgUnmlkzNcTbRLuf5a4IMmCJI+V0VyZ+ZVrEA5oN6Anq
	 HEtU+6TWr9fQf4CXNSu9dFVusgCt+L7uHj1hwdsLyE9wDYajcUVaS18ViYQcP+/ClVw==
ARC-Authentication-Results: i=2; smtp.kernel.org; 
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XMmuPSni;
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 85D071F0093A;
	Wed,  4 Nov 2026 07:32:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XMmuPSni
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 85D071F0093A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793777566; x=1825313566;
  h=from:to:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=uKIX/OujgwsJ5F+O49CWgmmdhe8L9nUpUIZIW7WPmgo=;
  b=XMmuPSnibl6vzY9+ezFL/6ltLNqKjKLxKjA6n/3e0fq3xVKV9I9afP4F
   RrkfqzlG4t8MAi6/bEjmohb17C/Y1I+t5QLV97uEoMlkC09bvi0bvurb7
   NsAxqc/I2DyCTPMzEzSIT9WP63Pku0wiwcwKpjgnADt4erOtofG7ck8D6
   9eZj9vKRCbLU0LE0Vpc8UoekTO7COrSTcyNnqrEYe/z6DF/bFBfbU4++g
   5yNdbJeawUaij50NZuo7vmLmLjzpyl4LvcRj5m6L5/OOWSNGMJBTz1nzu
   wYPIHa2ulXXx519na4VXyc3KP5Uqah/47u8HAxWtHQICd4uX8YibO0mg1
   A==;
X-CSE-ConnectionGUID: xUIHNLlVTHmffFVYbp6HKw==
X-CSE-MsgGUID: RRIQapLjS0iG0UO+J9kMMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2407840"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2407840"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 23:32:46 -0800
X-CSE-ConnectionGUID: 78dO2XY1RwqI/Wa+qAxVng==
X-CSE-MsgGUID: 8u7nh8CtQWqRaAMKMBQ4Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6995862"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 23:32:46 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 23:32:45 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 3 Nov 2026 23:32:45 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.43) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 23:32:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ATbNrQuQ+BN/GalJuolhR7/+GQvwksGgo2do95aew1sQ0MaNq2rMVIRIwMMm0mmyIfppizXDXT6Kr3rJjQ9jeeitGn2TqPgx2WXWKEQZkdwSgTKjgRj2R0z7lla+lfRo221jyc42Lg1Fgcf9ZQQO6D1Ld+AI6UOHuVBfS3VGAhay0kPT9/NJUIC76r6nDXvSo1jEl0K5RqMmY1cOYsANCAT0Zw+JJb1xLF4HIHL9SC3lbak+WWXy729qtMm22tdbsY8k3gxdo6sjSn6MjIbC27lqKdgPHJjeXYlJ/0pdkn6aVKKcCU+9t6UWmw4qC8rmxKHi4tUG+2jaYZ3LeKa3Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uKIX/OujgwsJ5F+O49CWgmmdhe8L9nUpUIZIW7WPmgo=;
 b=hP9evYR15jZJJMMlU3YV0dLLSfwVvpqzDu8vxn0zuTEf8xckykY3visgXl2tX2f5l3f7HX30HDL0cTMcJJi1QqiYZkSb9Cq+MGVHOBSR9trK/60vl31HGDd6UtZ0upyWs6SV36ctPv5CvjMKt5/8I6Rsizsh+f6Lx7bnYh7on0oFq5eX2RxQx5ioqKIMmIWh6kiMF8zoGHiafhbQ5Kb7pvFlQI1c8XMncFYbw2YDmQyBzLyIvUCO8e6EokrHQl0twskzsxJtSIHtOz7SUwcn3r4BE/9IqJi6bGpAd/56zFbFG4UcBn0sKIqMa9qhzv9fNpFBiT/sIu3hw+os+AUAEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB721313.namprd11.prod.outlook.com
 (2603:10b6:208:626::22) by DS7PR11MB9450.namprd11.prod.outlook.com
 (2603:10b6:8:26b::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Wed, 4 Nov
 2026 07:32:42 +0000
Received: from IA3PR11MB721313.namprd11.prod.outlook.com
 ([fe80::ece9:28d9:25bf:5805]) by IA3PR11MB721313.namprd11.prod.outlook.com
 ([fe80::ece9:28d9:25bf:5805%3]) with mapi id 15.21.0569.011; Wed, 4 Nov 2026
 07:32:42 +0000
From: "Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Josh Boyer <jwboyer@kernel.org>, "linux-firmware@kernel.org"
	<linux-firmware@kernel.org>, "Dreyfuss, Haim" <haim.dreyfuss@intel.com>,
	Linux Wireless <linux-wireless@vger.kernel.org>, "Yang, You-Sheng"
	<vicamo.yang@canonical.com>, "Hutchings, Ben" <ben@decadent.org.uk>,
	"kyle@infradead.org" <kyle@infradead.org>, "Damary, Guy"
	<guy.damary@intel.com>
Subject: pull request: iwlwifi firmware update 2026-11-04
Thread-Topic: pull request: iwlwifi firmware update 2026-11-04
Thread-Index: Ad1sLofFg+ePyp7PTc+TVIafQx35Ww==
Date: Wed, 4 Nov 2026 07:32:41 +0000
Message-ID: <IA3PR11MB72131346BF3C1FC358A2344FDAA3682@IA3PR11MB721313.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB721313:EE_|DS7PR11MB9450:EE_
x-ms-office365-filtering-correlation-id: 9567c2bd-c2dc-454e-e50d-08df3a45cfa7
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10067099003|18002099003|921020|261102123227099003|11063799006|261026140227099003|261021121427099003|261028144727099003|261022105027099003|261009223027099003|261021123027099003|56012099006|38070700021;
x-microsoft-antispam-message-info: o0p1pi9oeKRAVAUxx+6DnT7qiD3Lnaft7LMvwiocWaWoVZ+ZnEs/NA9cAMGonOyWGDu1EVL4yyzqwhLefsxs0ToD7dJTJBKw0R+0vjYGzlC+ZxRgQPV9GqXusIv294GtQUHzumzYLfMnFD/p1pgY6e/mGSZlR2insk4sU6WpGy7Dic/RcgWjfPOzqcieUWad2GHodQfiXFsEELzb4DO7AoGtrFmqKYpEQ6Za3wRZdGPW0FUE0vQKcMBXQiJq/G3w+Fw5w3vzCx6Oj4GeTdqgDxztuVH5sH8cG3t/BuRcw6iN1QWs58CDVlkShTwknK7QAyl811kwvVedre/C3CS6ZpBrKtxCHbG9nTpnxVAOkysNwCZ7U7A3yRMJxFRu9mfeYi1gsjWld1pjjL9Suat248k+7ISy8ptOQnE39VMft8FQNDYKZ2GA6q8IwSg12pFkphBFRBA8GywHSdUn4VMTnjQ+v7FboYZXz0UpNmXTkmEJSlmVeBfYHsUVQzlhA+SvHdsxLNtlOrIJnCzHqXL9lEoYmtg2UA0MTEcEmJuz9AWSfhfweAHwfeI9oLTAQeQEVMK5S2OJCYi/CDkVC2DD8FgLvFEQsh5y0hcopzcTMtJPt/BiVwmlXZZ9JqL7xGbH/FovcNl0tzDFzKDamOHKuXgScvv+wVOUDWi6zts5pUsyA4GeaDz7+BZFzpQQS5RC
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB721313.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(18002099003)(921020)(261102123227099003)(11063799006)(261026140227099003)(261021121427099003)(261028144727099003)(261022105027099003)(261009223027099003)(261021123027099003)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SzVQTkVTek51Z3FVRFdZdGNzcWJTS2UzVFN5akdMWktvQWJSSm1WQk0zNkV2?=
 =?utf-8?B?VnFMcGlkNHYwUFdXQ0xJUFF0ME1yWnFHQ05MR29LWGhJRzYvWjJ0YlFJRWk2?=
 =?utf-8?B?ZXEwc2ZkREpZTGQwRXZnVEdYMGVic2VHQjQ2U3B2Tis3dVlYbW5sbG1UbWEx?=
 =?utf-8?B?ZTY1WkllUnoxYU0vYW5vdERNc0NsSHhZdTgyQVVCQ0UxQlQ0MjlIU2xxZ2ww?=
 =?utf-8?B?Y1B0eDFGeU9CUEtwOHQ3YUkxRTFUZEZkZkZraisyNmFQeU9BZ1BDdE5iaDFX?=
 =?utf-8?B?UmFSa3dWTXA1cDkzMENwcHhaVm9kVlhmVFZYbHE0M0p2MkNPN3hoeG9ybys1?=
 =?utf-8?B?cFFSckppdU1RYTdEMjdTZUV4T0FYN0t6SmlMNHdpRUZldVVUaDlYTGpJVU5P?=
 =?utf-8?B?MkhVbHVUNUN6c1htSFpjemVUNkt0T1pyWEdIWW44NUo0SUdUalY3dkxyS043?=
 =?utf-8?B?cE9pOFNtc0V5TzRmVkdzL21yampXOGErdC9sSjFsQWpvbmRYRElkNDlnZndZ?=
 =?utf-8?B?OXVQbEdZWHZhNE1MRXdwZW9lc1g1Qk5TZ1p4c0pFcGdPSDVaOExDeWpCR3dK?=
 =?utf-8?B?V0dNdSsvV2tjL3kzaEk1OU9iWnhNcW1wZVd1THFtU3JHdUlFZ2pwTitKTkRW?=
 =?utf-8?B?MDU5SWRRVjNwVklURTJnQXF4bmdPS3VCZEtpdjJSWkN5YVJKbGV2T25kSGVx?=
 =?utf-8?B?OFVKeWRwZG82MW9hdlhhMDkzOGZuU2tEelBwV0hzWEl3c0lzQStIdkVxTmJu?=
 =?utf-8?B?N1B3L2o2bmtIYlFuR281YysxajVXNFUvRDNBUmIrTWp0Q0Z1dTFYQjhhTGhP?=
 =?utf-8?B?WEcxM1NDMjdSZjkwTDdvb0Npd3hsODVRQmcwczNUMytUM0htVmg0Qkppb1o5?=
 =?utf-8?B?RTV6L21PMnZEdEFuUUVXSnFmZ1NJWXZmMmoydTRIRVlQNVpOa3B4K1A2dE5t?=
 =?utf-8?B?aWc1WFBXekRURC9lTFgyajlHOWpOU2hXMnhzUDlnT2RyZXVqT1pPQVl4dE5R?=
 =?utf-8?B?L3JOQ3JraXBWMGVUWjBDWDNkWUFtWkFqSGllRG5KMlFlb0VnYUpjL1pqOWcr?=
 =?utf-8?B?cnF1KzhoK3gyc0ZEdFRhaFFjaC8wV3N1Yk9OUHp0S3RYTnNPQW1SSWUzbEJp?=
 =?utf-8?B?ajZYUFBKSkpQTlNyL2UyYnJsdlJRM3JEV1pCVnpoVGdGZzduS0pTY3ZldTR5?=
 =?utf-8?B?TjNIdmY3a3RjQVpLQ3F2aHo0KzNrYUQ4bXpuOCswUkE0bjczd3BwQXcvNVpn?=
 =?utf-8?B?cHFWUWdRMUNUcmo4SkxmS0I3bW4xUC9iOHNVN3QzdzhnbzBlcjdsaXd3bkFk?=
 =?utf-8?B?U2VDUGRETnZYWnpPSDZEVmg4Vmo1V1A3Y0NFSElSSUFJS0Y2L2poVWg1dmRO?=
 =?utf-8?B?UW00NnFJcUZiSk9MYTB4RmwyZVdrT1VjV0pSQVZDR3lWRHRyWmgvMkFXMTFH?=
 =?utf-8?B?eGFuZnVQZFJmUS9MdTBGQzBXcWQ2dEZnNFpxVDVUaVFmOTJLaldESHhFa2pG?=
 =?utf-8?B?SmE3R2FVK3luUjFLVDFudko4Z2ZERWNyZnRmZ0NRdHcwN2dLdFNqSGJLS1Na?=
 =?utf-8?B?SzNvdmJaV3FKdDhKVnppR2l5RkRidXJOczNPaU1qcWFKc010RFNHRUk2cmtr?=
 =?utf-8?B?K1pjZnQ3MnVlV3I2M0tLOWtySi85U3ZSblIwVFV2eThYRUFmSDlNZ3U0YmZm?=
 =?utf-8?B?K04xWFkyVzVFRWNTODByOXJrY1lqbWEvWmpURVdvREkvZW9WWTZEVTBLWEpW?=
 =?utf-8?B?Nk02QmozVXBpWDVGeXErZ2tIM2I5NG96Y2owdDl4bmh5L0MycFNka0hvbm8r?=
 =?utf-8?B?cS9Ob3NMbStUNVpsTy85WUxoYzJtZmRaWGh0SFE1bUZvYVI4U21HUW5CR29V?=
 =?utf-8?B?VnVaMUFPaVJkN05vWHIzdkZRVFBGTVBGL3AwRnhtd0ZsM2NGUVdFTEYvY0Na?=
 =?utf-8?B?WWJxcSszTXdpZDV6a0RzTmwvYTFJTjd0THBhMXpTWDVRTTBLWjhYbDFOLzU2?=
 =?utf-8?B?cHlTMXh0VUxoWDVSYUZrVjE4RXk4MzQxLzlDWXhwNmpXSDJaVXJxMVpjc0ty?=
 =?utf-8?B?elBYNjBDTUNrMmk0dmNRUnAvNCsxaEkvUnJzenlJOXZNSXpWeEM1UDRUVXE2?=
 =?utf-8?B?ejROTzczcXpacWlWdk5Hd2h6SWJ3enV0SDFncmh1TzU0S2VMR2lzZlNOVVRi?=
 =?utf-8?B?cStsd3dRdnVuMWZiZkhRQ1dndGhOWWtveWxSODN2V2pBV1ZIR1NDK2Rvcy8x?=
 =?utf-8?B?cUl0M0wwdXJ0ZmNMQXk2ZXBqM1ZKam94bjUyaFpnVjZ5L3RxNkJ2NTFqQVVr?=
 =?utf-8?B?V3pkczRIY2UrZ2VmdWx6U2FKbDUxWk1LQkdrdFQ3YXdlWTBRc1VielZGaFBF?=
 =?utf-8?Q?gXlxhgNASTz2oZpU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Dpz2GSResEUUTQMePYl+MGkYKcRzq9V63C7nzS7ZL3flqGuuNAXrFHDuOOk3tc8vi+nYQ7oitT7nKmm2gvDrJ/i33K3zvD9t5Zes11NyeVuysGitglDAR5JhKfwf0WsPFdlOllQcALWay9elgrtC8HIJeM45f+Wtxvw+WUgKx+lAx0Z8c97M/zt87BbcfoVnD/RyPy7z8QE0tJbAPsNP46o9QNuQIQmiPZm8oUsK1TwEDY2YoKv59RMXZns//Qd4GyKYEgG0YfkaxmU209/fJ18CJDFEupp3dg+moGUjImyIMhIXM9x3PWYH0r49fKY3aEiha/tDjAZ3gKV3Pu1nvw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB721313.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9567c2bd-c2dc-454e-e50d-08df3a45cfa7
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2026 07:32:42.0066
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: At1Jam01h6ZY4blIw3V5h/svsUKSHiUtIue1ED9Gt0ofJYEDXD3H92JElVeZVGHgMQ9yL8rD3drcZ6LSV1o0tPd4qQ0nJSRAaRuJe/pWFuX60fLaWveuYgYKbkjwHUYC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB9450
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGksDQoNClRoaXMgY29udGFpbnMgYSBmaXJtd2FyZXMgZm9yIFNDL1NDMiB3aXRoIFdILg0KDQpQ
bGVhc2UgcHVsbCBvciBsZXQgbWUga25vdyBpZiB0aGVyZSBhcmUgYW55IGlzc3Vlcy4NCg0KVGhh
bmtzLA0KTWlyaQ0KLS0tDQoNClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgMDI2
NjVkMjAxNmUxMzYwY2QyMTM1OTk4ZjM2Y2ZhMzAzYjViZTZlMToNCg0KICBNZXJnZSBicmFuY2gg
J21haW4nIGludG8gJ21haW4nICgyMDI2LTExLTAzIDA1OjM2OjQxICswMDAwKQ0KDQphcmUgYXZh
aWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoNCg0KICBodHRwOi8vZ2l0Lmtlcm5lbC5v
cmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2l3bHdpZmkvbGludXgtZmlybXdhcmUuZ2l0IHRh
Z3MvaXdsd2lmaS1mdy0yMDI2LTExLTA0DQoNCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0
byA4MzFlYjI2NWVmNjZkM2M5NGYwMjE1OTZiNTBlODMyYjY5YjYwMjNjOg0KDQogIGl3bHdpZmk6
IGFkZCBTYzIvV2ggRlcgZm9yIGNvcmUyNC43MC05OSByZWxlYXNlICgyMDI2LTExLTA0IDA5OjI3
OjUxICswMjAwKQ0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tDQppd2x3aWZpLWZ3OiAyMDI2LTExLTA0DQoNCi0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0N
Ck1pcmkgS29yZW5ibGl0ICgzKToNCiAgICAgIGl3bHdpZmk6IHVwZGF0ZSBTYy9XaCBGVyBmb3Ig
Y29yZTEwMg0KICAgICAgaXdsd2lmaTogYWRkIFNjMi9XaCBGVyBmb3IgY29yZTI0LjgwLTQxIHJl
bGVhc2UNCiAgICAgIGl3bHdpZmk6IGFkZCBTYzIvV2ggRlcgZm9yIGNvcmUyNC43MC05OSByZWxl
YXNlDQoNCiBXSEVOQ0UgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
MTAgKysrKysrKysrLQ0KIGludGVsL2l3bHdpZmkvaXdsd2lmaS1zYy1hMC13aC1iMC1jMTAyLnVj
b2RlICB8IEJpbiAyMjE0NDY4IC0+IDIyMTQ0NzYgYnl0ZXMNCiBpbnRlbC9pd2x3aWZpL2l3bHdp
Zmktc2MyLWEwLXdoLWIwLWMxMDcudWNvZGUgfCBCaW4gMCAtPiAyMjY4MjQ4IGJ5dGVzDQogaW50
ZWwvaXdsd2lmaS9pd2x3aWZpLXNjMi1hMC13aC1iMC1jMTA4LnVjb2RlIHwgQmluIDAgLT4gMjI4
MDQzMiBieXRlcw0KIDQgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGludGVsL2l3bHdpZmkvaXdsd2lmaS1zYzItYTAtd2gt
YjAtYzEwNy51Y29kZQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbnRlbC9pd2x3aWZpL2l3bHdpZmkt
c2MyLWEwLXdoLWIwLWMxMDgudWNvZGUNCg==
