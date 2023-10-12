Return-Path: <SRS0=GkXa=F2=intel.com=gregory.greenman@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3491CDB482
	for <linux-firmware@archiver.kernel.org>; Thu, 12 Oct 2023 13:40:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 829B9C433C8; Thu, 12 Oct 2023 13:40:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 41E75C433C7;
	Thu, 12 Oct 2023 13:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 41E75C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697118054; x=1728654054;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=pv/fLgDMfqiLUKZI2liPC8aRwOxSnqgUKxmx/9hsBbU=;
  b=QUmrQNAepRjDDN3uiZPX6RjIexdDIR6PGCPObzbbKAbJ7UaedZQN6Aal
   g4NPAN998nog0FMViS0AGEYAUd2Sij9PRwhOtu5xuvCXf4TAytolY2sVb
   PRBchWO4uY1LC2DUI8TkYYPTtIzzpFtb5dV6lwjknRjt5MfHwDRHSnh7e
   nZq/4ffJHW9cu9j+5nQ4f+zxN1VWMezY59UiTtlY8zWp9aJ65WSqwM2Md
   O9zA0Wut+6YfJhACgAO1Q2DCJGaczKuKzRZl3mYhKfbVR5vVGxpZe22am
   7NrTtcuWSryxGAX+QGk2sfFOtE0MrsDshmaIQcEls27vTJLAvi7vZN28+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="3524528"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="3524528"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 06:40:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="870581052"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="870581052"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Oct 2023 06:40:53 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 06:40:52 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 06:40:52 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 12 Oct 2023 06:40:52 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 12 Oct 2023 06:40:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GHh7Mt8rG6j78xNxD/lQyAor9GZO0I7l2uE45QQOzRhtVcBcRYMSrlPfZMNjRYmV4DVD7+Mdyc2xrjd/E5sq8kgT195BkDJvRVLuDqh2wq6XXKLoMbVB+JTlJ59WfJudSyFdW1H73gzCiIQ4Be5XAyKvXbE49Oati3DlFFLmEfSE6Cp2AVylvT62VSOf575zY7ZtIUst7CftlNuVNhRtjRS29cz1b3d7WMrI7PzsRvLYfNXH4vOBzJubO1WgmH2fwzTzArTyM9mvT6OkhIPNbpzQtEjpoWTRvUMHhDH9E1aqPe0z9juI/O0z+HUFNWAmaCNqZiSlR4s4rRyC3/W53w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pv/fLgDMfqiLUKZI2liPC8aRwOxSnqgUKxmx/9hsBbU=;
 b=ZXQ/g6pMsGEwqtRI+Ub4HPGVznK72P17uIa5RP+nf74xhQRSRjqEmu369AGZyFBlWYOwTw/UtxG8BaYZqlHX71oavrZiiv5esZ5EEqKkz5X8ugz6rO2m0SoOaHFvP7uTB1q9op0FG9nwtKT6jBc/0ix7Yi0hA8Q6YoAMyrc2nCm/iSXeHMM6anIcM4Z8ESwfkGtyblRlxuV8B5xZUL/OoRnTtWIyh17vSFdg7o+MxqzHHApVV34/q1EQKIDckGbeF+oHech4N8W2HLr30lwAUXRRtf0959uM7+hJTjqIEsioRuPyoEFytMmdmNRwggOqflzfs/kIxS22MIa2pq0i8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5987.namprd11.prod.outlook.com (2603:10b6:208:372::8)
 by SA1PR11MB8490.namprd11.prod.outlook.com (2603:10b6:806:3a7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Thu, 12 Oct
 2023 13:40:43 +0000
Received: from MN0PR11MB5987.namprd11.prod.outlook.com
 ([fe80::fe36:eb09:813b:5e01]) by MN0PR11MB5987.namprd11.prod.outlook.com
 ([fe80::fe36:eb09:813b:5e01%4]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 13:40:43 +0000
From: "Greenman, Gregory" <gregory.greenman@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: "Hutchings, Ben" <ben@decadent.org.uk>, "kyle@infradead.org"
	<kyle@infradead.org>, "Ben Ami, Golan" <golan.ben.ami@intel.com>,
	"jwboyer@kernel.org" <jwboyer@kernel.org>, "Yang, You-Sheng"
	<vicamo.yang@canonical.com>, "linux-wireless@vger.kernel.or"
	<linux-wireless@vger.kernel.or>
Subject: pull request: iwlwifi firmware updates 2023-10-12
Thread-Topic: pull request: iwlwifi firmware updates 2023-10-12
Thread-Index: AQHZ/RGycaigdDLGl0m0Fzsf3hoqwQ==
Date: Thu, 12 Oct 2023 13:40:43 +0000
Message-ID: <d922d3246f1e62d8380a7566bfe23479d8c0e748.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.42.4 (3.42.4-2.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5987:EE_|SA1PR11MB8490:EE_
x-ms-office365-filtering-correlation-id: 587f2df7-ed2a-4578-9c03-08dbcb28d4fe
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lB8Gb++0upLCcEejqy4126qrBa76D51+wlZRGFvLUyoISxjvUX18iydP3KPqAu1Dr/8XFdp/o+llOAs9rP5hX1mmpOjFeiLbVqLU87kTysanjFx9cZ895JNk19E6flukERGMcHuNbURh/SM4L1s3lIOIFZfA4OZCVYMvTx7o7yVuVh5AuBHCl74uHKluJVYIdsfB5tf6+vbL2dpxbnTT6sJq4aB90LsNl9EuCgAVZB8AQPj/1EgDRmYS+kWxq4o3T7JlOUdfrwyUo/xAckWBHGR8i/c69PlWXxeB6AoaqfmwbGtmoRKMG5Md90dH74GWxLEtx4ZP1E5GG5YcaxR/g7qCeyUvV3/K4yYtK02FCglKgESIcLfZKNvwXua2QZtzZ9nPMSvI4J0M9izSqrHnzS1LSCEwTNHOG2YU0gDr8qKfz0dkUlPzjnzz166hVxXsWzCR63fGSZF6RtjH2InSD5WP80tL9P29vy3aXTQ6aTp1ELu6wMOXNX2wpoigMUEQqz7og/zgOAoj/iGyQ8gkRXAmz2Cv0rLFVZNewTBbeFmPV3yr1XUkXrwqLPdGtxRofsQ8GdjiyvGIK3nDxbiiIQaMv6TdRRy+iSucK8+LBag=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5987.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(136003)(366004)(39860400002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(66556008)(6506007)(6512007)(4001150100001)(966005)(478600001)(26005)(6916009)(71200400001)(6486002)(8676002)(4744005)(83380400001)(2906002)(91956017)(76116006)(64756008)(66946007)(5660300002)(2616005)(66446008)(66476007)(8936002)(4326008)(41300700001)(54906003)(316002)(82960400001)(38100700002)(36756003)(122000001)(38070700005)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YnlZSVdVMHBYL2ljQ3M1OXNDMlplTFFIUVpsRUl3RzA0cmlEaHEvSDJ4dWsv?=
 =?utf-8?B?ODM1K1JJUVc3dVlTYytxRlFoOXA3Y0syTGpUeG9OSVdZWTRBR0UrSXduUnBw?=
 =?utf-8?B?eUY5RTIzakpNcHA5U0lFUVgxYW9INU5nL3dyOTFtTjdXWUZIL1RhVEJYTFZN?=
 =?utf-8?B?eDlJUzlnS1ArKzZQclA1a0tERGd0Q0hma1NwN0huRVBqMmJZV3Bya1ByNC9S?=
 =?utf-8?B?TmtFaTZzMDhNMm90RTZRaE1yWm9SUGlDR3lZdW94VTFSSEpoQTRaUy9aejdh?=
 =?utf-8?B?RXRYNTgwZjBJdktRdVpJRGJFZVlGdkE4TzJIaW5kQ0hHNytSS0lOOGkyV0tV?=
 =?utf-8?B?bWpSeFEvU1lCU1c3VmpVZ3dYS2V4bXFVcVZEQXJxN0NXSWwxSWhNNXZ5UVMw?=
 =?utf-8?B?aDdaRkJtRXErZ1BETDlBUDlxSUtTTXFUVFo1Ym50akFmbVR0SExsdzdzNS9r?=
 =?utf-8?B?Q3pZSzY2RENvRHJETEZ0Q3ZKZ1Bta3A2V3J0eTREQzZ6QUhyeU5XMXoyY3pJ?=
 =?utf-8?B?UVVnWmVZZlgzVEdrdi85akp4MFBsN0ZFeG9sTFdlb1VkMjJFYlF3NGRaN0Ur?=
 =?utf-8?B?bWVENGhRMU41cU1ZRXoxUjN6aEFDZWd3NC9BSTVZOVRpSDBiSEt0T2VNN2V4?=
 =?utf-8?B?THFZM1ZsTk93WWVYaHFGbDlraVF3RmhscHF5OXNZbzdpdTg4UVRSb280VXAw?=
 =?utf-8?B?VVhWdnh4UFhuc3lRekNONW15QkphbjljZ0EycStmc29RZlUrbHc2YlV0RmpB?=
 =?utf-8?B?Y1ZRMUMrdnByU2ozbzJlTTI1TElWanpGOFlUU2t4dy9mbmw1M3pJUy83cWtj?=
 =?utf-8?B?RXlKdkZjRnh2Q3ZqcXU3WVFOSFhJbVRHYzYwWWJUcmdiNnE5aS9KWERJOXZG?=
 =?utf-8?B?bnZwSVMwbVdxd2FlQzRUejJ2NlpNREdobWRIWW5YeXk2azNkdjlxNXVvVkJu?=
 =?utf-8?B?akxxVlBxWFZObXpxcklsVGQ1dlBib2RrcGl4VEdqQmF0UktFRnlYMFRsdjl3?=
 =?utf-8?B?QUVHTTZ1VlA3QmFjVVhwaEJFL20xbE02VFRlVituaVd0Qm9rQzdEUGI1TlM1?=
 =?utf-8?B?SjNJc1pyMm1QOW5ZZEVEdHAyWGttRlc4dVRrR0ZuYk1yMGpUV0F5eXN4QkFM?=
 =?utf-8?B?NWMzY0NxcFJETWRrSlM1Z3VjWGttNkcvNDRxcnJkcmJQWnBKb0oyRG9UVVZH?=
 =?utf-8?B?S1h0SGUweHAwMWNmcHRVcjRxa2NsMERFZnFHRFFEVzJvK0o4WFJiM01FREZS?=
 =?utf-8?B?WUtya20rMGpXanVOeGJrZjJQNmdESEZZZ2pXSG52cWRQZ1krYVpVT3lZVCtI?=
 =?utf-8?B?aGNCUjg0S05mUXNvbkxFeG81bjYxQ2duSy9UaDlMNVkxcm5OOU1RRUJPTEVp?=
 =?utf-8?B?RlJScVBEc09HN3N3MjlrNEJrMXIxTEZkVTRkUG54bjVFQ0ZkYUhub2tJUmli?=
 =?utf-8?B?NUowU3RJRXVOb0lhZEVVRUdlS1JlSG9KS21EQ3M0a21FVks1SFlGTEtQNUlT?=
 =?utf-8?B?amZqa3Q2djhoSkFkWWN4dUw0MGY3d2J2TjRPeFB5TE5TT2gzUlluTGt1c0FZ?=
 =?utf-8?B?d21PNEJBK0k5QTE0T0FsaS8rSUN5NmRuMzFNNWMyNTVMS0paNlFSR1hCOXJt?=
 =?utf-8?B?NnoybFNUbktRNHlVNkdDNE1WdEthUVE2dFNpRVpjT3ozb2tPREVqTlZ2c3k0?=
 =?utf-8?B?eUphdlJXZGpPcDJsY0JCWTNYUm1xRUE5a0xFVkNJQkJNUnRxUG5XNmgyRmlR?=
 =?utf-8?B?Q1czdFA4S2ZXMy9OU013R1prWDcvV3V5bmIveHM3bjdRejBLaVVTM3FSeUtW?=
 =?utf-8?B?d3IzeGVXQmU1TjZObFI4MHp5ZlBwWTJNMm1VSGVXOENBMVNEcGIrNmRrRFpT?=
 =?utf-8?B?MkZaWWNNRjE5TUJWQTVBcGV3Y3VjdEtXU2pmZ0pTZ0FzaXJ0QlhDcVlLWWFB?=
 =?utf-8?B?OXgwOXEvMm5UNUl6aXRTMzVtQ2s5aHhHT1NrRmdYcHNVVmxIbjRLN0xEZTNr?=
 =?utf-8?B?YVJZWjd2UjhHeWtONjhDc0xwaUJSTkhOaDkrRkZ2VHV0TDJIamF2eXlIRDZN?=
 =?utf-8?B?T1d6bGd3bE0zbXVXWDd2L1dsTVlvZnMrTm5uZGxCOXJtQk92cTN4cWlvMlZI?=
 =?utf-8?B?bEFPT0NlRkZCUUF1ZW9jMGRaSVNJenBlYlR1cXJOVFVlNkhjaXNndEtmMGFV?=
 =?utf-8?B?Q1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AE581EBFF5397C458BE0E7F94EB39946@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 587f2df7-ed2a-4578-9c03-08dbcb28d4fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 13:40:43.5125
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C6WbLtcKer5vJQVQZMZqDMNXJjYjS2e/lS3LB/BcZOwzUiSqS8LeQMStWg9qIwOEDGJa7ZX0DhDVtep1P5avPStJfCOxtLGmtFEE1Gxb9AY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8490
X-OriginatorOrg: intel.com

SGksDQoNCk9uZSBmaXJtYXJlIGZpbGUgd2FzIG1pc3NpbmcgZnJvbSB0aGUgcHVsbCByZXF1ZXN0
IGZvciBjb3JlODAtMzkuDQpTZW5kIHRoZSBtaXNzaW5nIGZpbGUuDQoNClBsZWFzZSBwdWxsIG9y
IGxldCBtZSBrbm93IGlmIHRoZXJlIGFyZSBhbnkgaXNzdWVzLg0KDQotLQ0KVGhhbmtzLA0KR3Jl
Z29yeQ0KDQpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDc3MjdmN2UzYjMzNTg3
MTNjN2M5MWM2NGE4MzVlODBjMzMxYTZiOGI6DQoNCiAgTWVyZ2UgYnJhbmNoICdwYXRjaC0xNjk2
NTYxMzI1JyBpbnRvICdtYWluJyAoMjAyMy0xMC0wNiAwMzowNDo1NyArMDAwMCkNCg0KYXJlIGF2
YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6DQoNCiAgaHR0cDovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9pd2x3aWZpL2xpbnV4LWZpcm13YXJlLmdpdCB0
YWdzL2l3bHdpZmktZnctMjAyMy0xMC0xMg0KDQpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAg
dG8gOTJlMjRlMDQ4MTM2ZDZlYmYyOWJkOWYzYWZhYmEwZjI0Zjg5OTdjZDoNCg0KICBpd2x3aWZp
OiBhZGQgYSBtaXNzaW5nIEZXIGZyb20gY29yZTgwLTM5IHJlbGVhc2UgKDIwMjMtMTAtMTIgMTY6
MjI6NTUgKzAzMDApDQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCml3bHdpZmkgZmlybXdhcmUgZm9yIFNvIHdpdGggSFIg
cmFkaW8NCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQ0KR3JlZ29yeSBHcmVlbm1hbiAoMSk6DQogICAgICBpd2x3aWZpOiBh
ZGQgYSBtaXNzaW5nIEZXIGZyb20gY29yZTgwLTM5IHJlbGVhc2UNCg0KIFdIRU5DRSAgICAgICAg
ICAgICAgICAgICAgICAgfCAgIDMgKysrDQogaXdsd2lmaS1zby1hMC1oci1iMC04My51Y29kZSB8
IEJpbiAwIC0+IDE1NTI0ODAgYnl0ZXMNCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBpd2x3aWZpLXNvLWEwLWhyLWIwLTgzLnVjb2RlDQo=
