Return-Path: <SRS0=jK65=XD=intel.com=lixu.zhang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F9DC369BD
	for <linux-firmware@archiver.kernel.org>; Thu, 17 Apr 2025 03:39:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5743DC4CEEB; Thu, 17 Apr 2025 03:39:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F2FFDC4CEE7
	for <linux-firmware@kernel.org>; Thu, 17 Apr 2025 03:39:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F2FFDC4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744861171; x=1776397171;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=9IUhKBS3SpSN0MU8kMhU7HctB2IZe7biA50vGGB07Z8=;
  b=ZKuXNlqhVEEOmiuPSbzRJ5vp2G+iZ+eqK29LoGfeWEedpaC3oZqP0m5B
   IqDYZRaLfHYcgsLFdDm6NCDfl6iJXCB+MnsOpnCo+SvK4iXrnLuQPHcK+
   4jpaX/KqQp70NMTDtIdGYNFj8V5TpO6c/T2oqqQuHQ/pSNd/9xPJUAlSN
   vbYGBIhUBvyTRQO2wbLWKxEIA3JzkkDCQGyFTR7Tr2t000p3E/qUqfwoo
   n6st3URdlwrw99LI86Kk7JW83S9UMzGxKf6yrqW8Q8QMT6siRmW0Kz94d
   7H9QcZ46MFYKV8UOjzOX3g/jRO9GfDnQDW8mlWL2r1EvFdrpVhOfvPpwW
   g==;
X-CSE-ConnectionGUID: W4hTPhHoTLq2v8qrQS9Wtg==
X-CSE-MsgGUID: hPZ4Nc5gRTuT61Fe9Idaqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46564405"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="46564405"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 20:39:30 -0700
X-CSE-ConnectionGUID: 1/wHkhQKS56rzcDDXM4E8Q==
X-CSE-MsgGUID: TcFSav0DRiSN/XH940uh9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="130661223"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 20:39:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 20:39:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 20:39:29 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 20:39:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hK8ATz+u/5xg/87lw7FVcOa3Pg684tx5U/PX9CusIUV1CwmJZN63kEBtkCOm+hnsG8QqiA9Ui6QouO7uPo74WfihpAJX89wuiDg3jE1iYTf1M8xAy2ZynWaOD6BJvbef6WelQzpxBWRWKs5tzVfi6NMMKJ6ek19bzzzjBarm37mZBZu2mxobp8+oya6gBzOSa5cedft8SVZQeDaTGGjksaanVBNRS9ii3M7idI2moIpPp3vzMj1JqQzuBBb0f9KyFaQ0fiu9/qVAMQsGWDx1U2UnEZwTTiKv81qglAO967fTcb3nepQ3yCpYSnl3/WhYmKD+v87PqJ42MoGBC6cBVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9IUhKBS3SpSN0MU8kMhU7HctB2IZe7biA50vGGB07Z8=;
 b=YqPXGHdZaZu7BA4Yv9L2t7mX+oaH6AQiDVrV6DZNUf4Oohi3VjbxxG06I+MS/eyA7HHkyz1UZjry/UWagAvsDxJzIFpPLUdMaRgmk7c7NCTpKL/X+bE1LJh7hyUgu7ctfkGEiKnvnQVViil6qEnNYfBrpoKE18nGM12eXhTq2F/z+dNOqyB/a6mgMadxVqKKmfySbp0De58Vt1E47ryG1UwLN1gyvB3Qh0uyWioyVg+pvTJkYCqNk2tjmNF98BVhHLvYzm6/2YhzEFslvDr/eri27wal7lPPM98+YSMJVYv7n8HA9OfbojIDV+ODAUmyK2gWlTxXJitsviTAjSl6NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5995.namprd11.prod.outlook.com (2603:10b6:8:5e::11) by
 IA0PR11MB8397.namprd11.prod.outlook.com (2603:10b6:208:48b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.31; Thu, 17 Apr
 2025 03:39:24 +0000
Received: from DM4PR11MB5995.namprd11.prod.outlook.com
 ([fe80::654c:a738:ac8:7908]) by DM4PR11MB5995.namprd11.prod.outlook.com
 ([fe80::654c:a738:ac8:7908%3]) with mapi id 15.20.8632.030; Thu, 17 Apr 2025
 03:39:24 +0000
From: "Zhang, Lixu" <lixu.zhang@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "Hutchings, Ben" <ben@decadent.org.uk>, "linux-firmware@kernel.org"
	<linux-firmware@kernel.org>
CC: "Wang, Selina" <selina.wang@intel.com>, "Wang, Zhifeng"
	<zhifeng.wang@intel.com>, "Han, Hemin" <hemin.han@intel.com>, "Yue, Ling"
	<ling.yue@intel.com>, "Ma, Michael" <michael.ma@intel.com>
Subject: RE: ish firmware is undistributable
Thread-Topic: ish firmware is undistributable
Thread-Index: AQHbrI1GE6yS1GTQh0WkE1KZ85IPx7OiZp7AgATURvA=
Date: Thu, 17 Apr 2025 03:39:24 +0000
Message-ID: <DM4PR11MB599510AB7F1820354A037C0193BC2@DM4PR11MB5995.namprd11.prod.outlook.com>
References: <91d589d2c91c4c32406d27ad280a5187ca773a8c.camel@decadent.org.uk> 
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5995:EE_|IA0PR11MB8397:EE_
x-ms-office365-filtering-correlation-id: b5bd414b-5111-455b-16b0-08dd7d6172c6
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?T1g0c0huZXlUWnlLQmdZai9wU2k5cVdrVzduYkRnSUtJUTdFSlNmZkRjdFNq?=
 =?utf-8?B?Y255R0tleGRsK3JSY3FaeEJFckNldDJFeHAxb3VPYkNGQjhxUExZVmZLM2Nu?=
 =?utf-8?B?VWhQTHhpNXh6bEpjMWI0RlArMG1lemlRdmdXeWNOYmdZSDhqWFhMYUhUZ2pB?=
 =?utf-8?B?ekVVQ1FhYnJmMFpFYjFPUmdJTU1PV0J2aXAycXlIV3o0aHp5aWFPZHpUWURT?=
 =?utf-8?B?YkJoaWhaS0NtNmhhZk5jOU9naHFHbENhYXUzUC93clBiQ0ovNkE5NWFkQ01w?=
 =?utf-8?B?MUlza1hqL2dsVnFJMGxKNGw5L0Z2a2Vua21zWFdXc3RxdXFBUFhYcndUamxE?=
 =?utf-8?B?R3Q1WUxKanRGWERNVzRBeFlpTGdWd2VobjNyaEpDSmJUcGVKNEc0Wit0bGlC?=
 =?utf-8?B?ZGZ3YjlaMVo5dWJYMGJTMEhCY2ZzRzl6c3Nka0NXbXdqNXlvR3N0amhBd0Na?=
 =?utf-8?B?K0EwRjlKaGIxaG16TFBkemFOVHpSWFdBZTg1RHVQTGwrQno4VHdheS9hMjdq?=
 =?utf-8?B?d0pBd211VXhLbnphMytMMnJLTXZRKzgwcjRLaGRNenR1STg2SmdDV2NVNHVR?=
 =?utf-8?B?V3drVnJIaWRQKzJReUZGWWtvL1JvQ3BNbStORnNnYm9IcmNBS3Q2N0tvYWNw?=
 =?utf-8?B?Y0p6TzNMNW1NYngxcFN2TGJXTHI4VkNjaDE5SjNEVG1nNkFLOEthcElxMzl5?=
 =?utf-8?B?RCtzVHlYNlhsOFRmY2JSZHZsWGpRcThmc1c3OHFJVno5ekRGWmsvcktwL1hT?=
 =?utf-8?B?Y01NOXpZZWRpbFdoZVJXQ1MvUmVqcjRESndVL3JjWCs4cjVSS05lc2gzR3VO?=
 =?utf-8?B?OUlrakNYNDV1K0hPY3J6QWZ0ODlobXdHZ3liSXFvVG1VM1ZadGsvQ0NaTzhn?=
 =?utf-8?B?VEY1NzNLa1VWV2QxVWV3UWhIbGVGN1hDT2F0bThaaVdvR3JPazhKWE11N0lS?=
 =?utf-8?B?Y3V2Z0ltRWhWeTg4OHptdW9xQytZQ3hSblFhSzhQeDhLTlZlbFE0dXF3R0sv?=
 =?utf-8?B?a1BPWnBpd2lTb3FNV212TXhmYVJvQnY4dHNGY3FuTWpPaW9YS29IL2lsV29a?=
 =?utf-8?B?WXd3WEg5bUE3OFk0V0FWT093bDlIL3k1bFAwcDRZNDF6QnhyckNEeU11Nlc4?=
 =?utf-8?B?VzQ3M0txVzk2aVhDM042dVhFTTFRS1hzR2x0OGJQc3FMci9rUUZPMllhbEhN?=
 =?utf-8?B?U3dldUxGS2pObVYvcG84R2ZTcTBnclpWcTRybE1pTEVBVzNGRnZqL2oyc1F4?=
 =?utf-8?B?Q3NKVDNXWHJ1dkt3VllINE1PSzZRcVh3ZEF4MzI3OU5BQ2NxdmhTd0lJbnJj?=
 =?utf-8?B?d0tXbS9ORDI2NEZFLzA5UHRiTEwwYnRFVFlqV2NCQSsrWVNnbTQ4WGludmZ5?=
 =?utf-8?B?cHZZRXVnekJha3R1QUZZeXBMb1hwREI1b1RuYjNWRzF1MkpQd2tPWGQ3Zlly?=
 =?utf-8?B?dHF5WWJMVG9Md08zN0lqajFJdzVPZ1h1WU9qN1RlcEc3d0x3cTJZL3RyQ0lv?=
 =?utf-8?B?eGNhTlRySUljd09vTXRGZFJMMUh3OFhwMXZPL0ZRaG5yc1RmQ3NvVE0xT2VU?=
 =?utf-8?B?SElLZjViYm02Y1c1NHVHcVZubWdJYVR4M1ZVdFFyU2hYNWg4QmEzT01mQUgy?=
 =?utf-8?B?bzQ5blVGVVRoTUZCYmN3Yy84QVdwNnpOWENIUzhVUE5EWFVjcS9FNnl4cDc4?=
 =?utf-8?B?em5USlFEVittZm15ZXRLYjhmcGg0eFVROHpGcjZiUTF1dFBNMTVIU1Y2eE01?=
 =?utf-8?B?Z3g2YWJrckhSTTBJcFhnZVBlVWsvYjIwVzJmQ1pkcWNGKzIwSnNkVFJ6M3Mv?=
 =?utf-8?B?R3JMMytNK1hqbGJuTklmWFd3L0RlWHpJOTdWcU8zUERuTzZGZ01RU0UrYVBC?=
 =?utf-8?B?NGNaRHBSaEo1dDBZWWo3and0K25ucUF6MDhXdEFDak5GajNiYTgyU1NLQW9C?=
 =?utf-8?B?TXpoUFdIajlMQmlMazdrMU5oU20vMHZXUzBTOUVaU3dtVUdEcndxaTFDTzVV?=
 =?utf-8?Q?w6XZ8WNCE5m6oYIFb8uKp32SW4aYJI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZEJXQkNQa0w3cHVXVUlmVTFlVzk5V2hiYU5GeDh4YkYvWG93T21xSWlLQnRO?=
 =?utf-8?B?RmFTQ3hsMU1OcitKUlZQMVgzMG5rTno0WHRRdDRGZURWWm9XclA2QmV5eXgv?=
 =?utf-8?B?NTVvbThTcG85aWNwbTNOdkFSR3h5dG0vY1h4WEp0ay9neUNmUXI5RTJyMjVt?=
 =?utf-8?B?czUwczUzS1JpR0lDVWRpUjZiY1diUUFzN3ZobVNxVk94V0pYSlRiSng2SzZo?=
 =?utf-8?B?Tk1TWHRpaElEaWZmemRhZmZhQXVBMHpGVVBuMG5sQXJrcHFkdEloMmw0WGpt?=
 =?utf-8?B?Q0hTUWJCMllJSm9NSFFDbTBGL0xxeGZJWVdkRkhrZHVOZ1NKdlZpcTFBTnND?=
 =?utf-8?B?YnBOTWN0TXFqVGsxc24xNktwSmlSeXIrd3BlSnJoVzhHcjc1R1ppT3dySHk5?=
 =?utf-8?B?MUEyYWJoZnpzY2RHUG54THNLYUJqRGhpeGFrOVVPMGZYeC9MYTUxTmxuZ01W?=
 =?utf-8?B?dlprODlXNVZFOFB3ZVg3RThlMGp6YkVNUmJmVEtyV3ZtenRiZWU4TU8zb3Mz?=
 =?utf-8?B?SmhwMHBzaU5TTEZJa3pBV29qRDFPSXM4ZU81b1k0UHhrWVJRd2JwQkJneDBR?=
 =?utf-8?B?RUw0NC9rbEFCRnI3YzRndFUrSGxYeC9tMWdFMGl4ZUNNRDJTSDBMaklSK0hE?=
 =?utf-8?B?WVFLYlVCQ2JwVFFzblRJRUphMmdyTCt1bUY2NS9zNXYvZFI0MFJBNEU0TEZa?=
 =?utf-8?B?OWVsYmVrUTZzVk9YSVl6V3JhU1N2djg1c2FQaENtRFY1MkZqYnl4T1VoUk9p?=
 =?utf-8?B?ekdKbjVIZldUZ2Y1NU5NRkVZNW1QenFEM1FHUmFWL0FVbGRxYXBnM1BrT2Js?=
 =?utf-8?B?Tzg1RFE0TW0yNzkycy81Q3dBT0IvZm9CK2IxN3JYOXI4TkFWaDlGM2pqVDJp?=
 =?utf-8?B?cEJFQ2RpTDRVVS82NzNUNzR1RzBpQ29vVDFueGtLbldQZzNOTEtVNUVERkFt?=
 =?utf-8?B?SjVWclh0UzFvUUZpOTJHalVTQjIwQmNtcDZKc0xQUFFCbjdHcitQVURvN29p?=
 =?utf-8?B?dFh3V1pTMldWckhzamxXZnpERzBOeU12RVhCdmF0Q0dHSVFxbStDTUZiNHlp?=
 =?utf-8?B?WmY1MWlsVHAvbkxoZDJjY25KYWJQTm5hVlNjUENlVDl5OGhobDd0QTBNUFhG?=
 =?utf-8?B?NHIwMTIyR2VlUHZSOVNqUloybTVXTVNScGpDNDAvMldWUUpGanNhTXpyNndH?=
 =?utf-8?B?bWIxQkdHL1l3NGM3d1BOU3RKeHRIY3lxMWNvdDl4MFd5MnZzemNQV2J5MnBN?=
 =?utf-8?B?aXpxRnJyR1BvaXNUSzd1Ykt2YTI1ZXl4YVBxVStXdWs0QmVPcC80NHFPN3pr?=
 =?utf-8?B?RmZCOUNSRWJab2VxQlMzdHIzK3R6ZHdWK25XN0lQK1p2RnlEdDBQV3Z4NWo4?=
 =?utf-8?B?RkVaZFFMTUFqeWZONTlreXhuYWQzQ2oxNzBlQnBDbUNReXBCUUpVWW4zd21H?=
 =?utf-8?B?VUZLbU9md0VoRy9QQndOeTRZUzlkRVM2Q1RlMms3MmtsU21BV1VhemFRc01p?=
 =?utf-8?B?ekxHZ0NXQnU5TDJWTmZEWllDM3IyZG5oOHR2Y25HRUt2ejVLY1IvVjJDZ1dJ?=
 =?utf-8?B?M01mTzh5Rml4ODFPMDBDV0NaVXlkTFg3Mk9RaVN1eElUb0RrTXZMY09oa1Rr?=
 =?utf-8?B?dWo4cHU3cUpQY200eU10TG0rWVY3RU90OTJhSCtQMXRCaGVpUzU4WHpKSnk2?=
 =?utf-8?B?STI5WFV3NjRlbkIwc1JwTHJreWlyVkkrcS9VRmdFcUhZbnFyZjB0aWlCTGZG?=
 =?utf-8?B?dUdWdTVKOTNJcFNuYzgySkhnOXhQZE5GNVg5dDZvdzVSQWdoMWJQRHZjbmQr?=
 =?utf-8?B?aDk2NG4wK0d0amtCV1ZkMnJTRG9tWGNtMDQyWG5qc2R1MjBQcEpPdS90QTBm?=
 =?utf-8?B?RC8yaXo5U1BTeGsxQ2IrdldIL25KQStkcks0TVlSWDFXL0RuMCtkbDM5dklz?=
 =?utf-8?B?NklTTngzMDFZUVJIdjdOdnRROS8xNWZ5MHd3aDNUbmpwZlVJT3BHVjNDVWxE?=
 =?utf-8?B?VTE0azhoMVY2cFRBWEdzYzZnSGdyRUdyREhNRlVIbnZWMnpkd0FyOFpqTHpr?=
 =?utf-8?B?SlZqMEF6d2NjbU8rZGJRTzlDVjY0cjdsQ0ZNdWJJT0JwSzRHclhhVzhPNkZv?=
 =?utf-8?Q?YHEc1Mu6kvizdMWiN1+/n7QPi?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5995.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5bd414b-5111-455b-16b0-08dd7d6172c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2025 03:39:24.7218
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jS7J6PpJfaLVkNPtFgBxyzB2yLNrtUhfC1/uagB1TLQF4VKFaQrnTdXnZdh20ZILRvd/hFOBE+Z5R2gy5FIQnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8397
X-OriginatorOrg: intel.com

SGksDQoNClVwZGF0ZSBzdGF0dXMuDQpJIGhhdmUgY3JlYXRlZCBhIE1SIHRvIGZpeCB0aGUgbGlj
ZW5zZSBpc3N1ZS4NCk1SOiBodHRwczovL2dpdGxhYi5jb20va2VybmVsLWZpcm13YXJlL2xpbnV4
LWZpcm13YXJlLy0vbWVyZ2VfcmVxdWVzdHMvNTE0DQoNClRoYW5rcywNCkxpeHUNCg0KPi0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogWmhhbmcsIExpeHUNCj5TZW50OiBNb25kYXks
IEFwcmlsIDE0LCAyMDI1IDQ6MTcgUE0NCj5UbzogQmVuIEh1dGNoaW5ncyA8YmVuQGRlY2FkZW50
Lm9yZy51az47IGxpbnV4LWZpcm13YXJlQGtlcm5lbC5vcmcNCj5DYzogV2FuZywgU2VsaW5hIDxz
ZWxpbmEud2FuZ0BpbnRlbC5jb20+OyBXYW5nLCBaaGlmZW5nDQo+PHpoaWZlbmcud2FuZ0BpbnRl
bC5jb20+OyBIYW4sIEhlbWluIDxoZW1pbi5oYW5AaW50ZWwuY29tPjsgWXVlLCBMaW5nDQo+PGxp
bmcueXVlQGludGVsLmNvbT47IE1hLCBNaWNoYWVsIDxtaWNoYWVsLm1hQGludGVsLmNvbT4NCj5T
dWJqZWN0OiBSRTogaXNoIGZpcm13YXJlIGlzIHVuZGlzdHJpYnV0YWJsZQ0KPg0KPkhpIEJlbiwN
Cj4NCj5JIGFwb2xvZ2l6ZSBmb3IgYW55IGluY29udmVuaWVuY2UgY2F1c2VkLg0KPkkgd2lsbCBp
bW1lZGlhdGVseSByZWFjaCBvdXQgdG8gdGhlIHJlbGV2YW50IGRlcGFydG1lbnQgd2l0aGluIG91
ciBjb21wYW55IHRvDQo+YWRkcmVzcyBhbmQgZml4IHRoZSBsaWNlbnNlIGlzc3VlIGFzIHNvb24g
YXMgcG9zc2libGUuDQo+VGhhbmsgeW91IGZvciBicmluZ2luZyB0aGlzIHRvIG91ciBhdHRlbnRp
b24uDQo+DQo+VGhhbmtzLA0KPkxpeHUNCj4NCj4+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4+RnJvbTogQmVuIEh1dGNoaW5ncyA8YmVuQGRlY2FkZW50Lm9yZy51az4NCj4+U2VudDogTW9u
ZGF5LCBBcHJpbCAxNCwgMjAyNSAxMjowMCBBTQ0KPj5UbzogWmhhbmcsIExpeHUgPGxpeHUuemhh
bmdAaW50ZWwuY29tPjsgbGludXgtZmlybXdhcmVAa2VybmVsLm9yZw0KPj5TdWJqZWN0OiBpc2gg
ZmlybXdhcmUgaXMgdW5kaXN0cmlidXRhYmxlDQo+Pg0KPj5IaSBhbGwsDQo+Pg0KPj5JdCBzZWVt
cyBsaWtlIG5vLW9uZSBhY3R1YWxseSByZWFkIExJQ0VOQ0UuaXNoLCBiZWNhdXNlIGl0IHNheXM6
DQo+Pg0KPj4+IDMgQ09ORklERU5USUFMSVRZLiBUaGUgdGVybXMgb2YgdGhpcyBBZ3JlZW1lbnQg
YW5kIHRoZSBNYXRlcmlhbCBhcmUNCj4+PiBJbnRlbCBjb25maWRlbnRpYWwgaW5mb3JtYXRpb24g
YW5kIHN1YmplY3QgdG8geW91ciB2YWxpZCBjb3Jwb3JhdGUNCj4+PiBub24tZGlzY2xvc3VyZSBh
Z3JlZW1lbnQgd2l0aCBJbnRlbCAoQ05EQSkuDQo+Pj4gRXhjZXB0IGFzIGF1dGhvcml6ZWQgaW4g
U2VjdGlvbiAyLjEsIHlvdSBtdXN0IG5vdCBkaXNjbG9zZSB0aGlzDQo+Pj4gaW5mb3JtYXRpb24g
dG8gYW55b25lLCBpbmNsdWRpbmcgdGhlIFUuUy4gZ292ZXJubWVudC4gVGhpcyBBZ3JlZW1lbnQN
Cj4+PiB3aWxsIG5vdCBiZWNvbWUgZWZmZWN0aXZlLCBvciB3aWxsIGF1dG9tYXRpY2FsbHkgdGVy
bWluYXRlLCBpbiB0aGUNCj4+PiBhYnNlbmNlIG9mIGEgQ05EQS4gVGhpcyBBZ3JlZW1lbnQgd2ls
bCB0YWtlIHByZWNlZGVuY2UgaW4gdGhlIGV2ZW50DQo+Pj4gb2YgYSBjb25mbGljdCB3aXRoIHRo
ZSBDTkRBLg0KPj4NCj4+U28gbm90IG9ubHkgc2hvdWxkIHRoZSBmaXJtd2FyZSBub3QgaGF2ZSBi
ZWVuIHNlbnQgdG8gbGludXgtZmlybXdhcmUNCj4+dW5kZXIgdGhpcyBsaWNlbmNlLCBidXQgdGhl
IGxpY2VuY2UgdGV4dCBpdHNlbGYgc2hvdWxkIG5vdCBoYXZlIGJlZW4gc2VudCBlaXRoZXIuDQo+
Pg0KPj5QbGVhc2UgZWl0aGVyIGZpeCB0aGUgbGljZW5jZSB0ZXJtcyBvciByZW1vdmUgdGhpcyBm
aXJtd2FyZS4NCj4+DQo+PkJlbi4NCj4+DQo+Pi0tDQo+PkJlbiBIdXRjaGluZ3MNCj4+T25jZSBh
IGpvYiBpcyBmb3VsZWQgdXAsIGFueXRoaW5nIGRvbmUgdG8gaW1wcm92ZSBpdCBtYWtlcyBpdCB3
b3JzZS4NCg==
