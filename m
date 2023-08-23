Return-Path: <SRS0=R/q5=EI=intel.com=fiona.trahe@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E877EE49AE
	for <linux-firmware@archiver.kernel.org>; Wed, 23 Aug 2023 08:53:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E2529C433CB; Wed, 23 Aug 2023 08:53:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 36E1AC433C8
	for <linux-firmware@kernel.org>; Wed, 23 Aug 2023 08:53:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 36E1AC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692780807; x=1724316807;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Vmq5B3GXh/Q7rSdhgLKDmTaBN5Cej2usC1+sHlqAhD8=;
  b=bU0ehyuq8zhwXjswyoP62Qw3KO8wcNVNRyLg6iUink0np0rm7wCjEh9J
   vkt/wcnDXmLyMsewTQmPurkUML3vm9w9UfQT8TwoPijZDjPgQGl3i+xmP
   M1oxcQYVi+DB8eEdIgGRq5k/iG98HmJOi7WteaObu/I57XZw3uYMCil7c
   84zf6ZLeTblxepMqEOzcR+4UZdff6Pn5zmpxrYFw7HPhGVa9RDv5Y8OXr
   zCtwPKNGUFAXz5YuYag0SRqn/UZMk9rJ/q4veu4TUMV+WgNgf45kHerk9
   0BmWsRPT8E7eWpN4vZvOlKaSHgnalMZjZnVVDtW0KCiVFlNzgDSpffWM1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="364284180"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="364284180"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 01:53:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="802016781"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="802016781"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga008.fm.intel.com with ESMTP; 23 Aug 2023 01:53:18 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 23 Aug 2023 01:53:17 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 23 Aug 2023 01:53:17 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 23 Aug 2023 01:53:17 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 23 Aug 2023 01:53:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m6JLolibJWWrRSufWIW/BUpfTyhbFpMaTKitKYRNZ4TwIZFkQkr16FiiUO1KG7MrjSuDbcpx1W5nXbFN+fsXSFDdlgekYLkvdLcogOyRK9p5jO/447aU0NWZDlM0MDR5WM8xGH0YDtaJhBt/TSXkahQLsbm3NBPssY8iITOe+a0G1APU2CvDNIC38cjvqFF09yw1DjyuRWoVwg26c27OMR0pSUPfyf1ABI6MTZ7CmOJSzqFVoMXVdANG+w0ZBfBT8W77GesQG6hFE/71pBUk6Ee3/7hw0f3tLJ4M53ZyZ6rE/3tEgMZi6u50bgiZI1ULuYJFNFE02I2lBEN/AdK5pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vmq5B3GXh/Q7rSdhgLKDmTaBN5Cej2usC1+sHlqAhD8=;
 b=beZ5ozsFzTxFh/t8EPE8PBtS6RCm7iM/PCUcXbzkfR2QoG5syuPWjE0PPrlznMQLnPlfbky0D0N5LEGzm8Ju4V7iAUrfUGOyeu6ukhwgMzYMz8hAK7CAdjDl2fyaWK8QeSSJg+U0jtjvAA4uEso6XLix9hinlXdSvf7hRsVUfryEHYg3Kh3rZ/cfVELOA9kaO7+UsNP1vaEe6nD+57MFPa1FpHlCF4tzGAsWBHsakstTuTK6D1sAzIDhrb/PQv5ODh4B8RTQODGZRIHkNN0qTXt8XyBanUuuvXKnUoSEd6cW40B3u56o7RnDASrwBJj3Crb9cQXNviMSI2XV5u1wnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB6982.namprd11.prod.outlook.com (2603:10b6:303:228::10)
 by SA1PR11MB6918.namprd11.prod.outlook.com (2603:10b6:806:2bf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 08:53:10 +0000
Received: from MW4PR11MB6982.namprd11.prod.outlook.com
 ([fe80::5a65:32b4:116a:18c7]) by MW4PR11MB6982.namprd11.prod.outlook.com
 ([fe80::5a65:32b4:116a:18c7%5]) with mapi id 15.20.6699.022; Wed, 23 Aug 2023
 08:53:09 +0000
From: "Trahe, Fiona" <fiona.trahe@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "Guerin, Adam" <adam.guerin@intel.com>, "linux-firmware@kernel.org"
	<linux-firmware@kernel.org>
CC: "Schuetze, Joel D" <joel.d.schuetze@intel.com>, "Cabiddu, Giovanni"
	<giovanni.cabiddu@intel.com>, "Trahe, Fiona" <fiona.trahe@intel.com>
Subject: RE: [PATCH] linux-firmware: update qat firmware
Thread-Topic: [PATCH] linux-firmware: update qat firmware
Thread-Index: AQHZ1SqVTNpl9QqXUE6OrQ6G6R4QIq/3kznw
Date: Wed, 23 Aug 2023 08:53:09 +0000
Message-ID: <MW4PR11MB6982776DEB988F5755E1071AE41CA@MW4PR11MB6982.namprd11.prod.outlook.com>
References: <20230822184128.303877-1-adam.guerin@intel.com>
In-Reply-To: <20230822184128.303877-1-adam.guerin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB6982:EE_|SA1PR11MB6918:EE_
x-ms-office365-filtering-correlation-id: 34fb77ba-c1cd-41ea-5771-08dba3b6601a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bg+dBhml3k8p4GMaEmAXw2+PuV/kCwaLvd24t4xCg5Y1TcfyFzcQuZjTtoMVJdNnmH0eCJ73oMt37xAvmUskEaCUVpKOtfHZtBOUQjwI+P1Sn3i5eXPhS/XjfdZgZQ64TsBvsRWXAiac2nD7bTHZ+XvEzOGVl8Oyy4XJVLzOFjE2ngqEty/mp8iFt++mv214/UAOCXCXSN6k8Z3C2Y+rMvrZ0Ux/VjSxbZgA0uJLF436oe2gvLwTkOvOC4Q/MU/TiJubN3+8m6ZTmjMBiclEOr/NhGm8GFfb7IGcMsnqB/Dtm1y/jf2PZIDLUTIZcmEM3EeqF935Kn9ox49mqVPXnNPLlg96rdPBg7FLpw8KAuFcYP5GVqFNiDloFsvl5NmXw2qR+hxCcnCuclEY+L4Zyu72KmtrGvbpwaaaFHw6rrDHP3jZQZNZqMaR7GqXa5pUulKgKLwjqQDCoRW2ZIJPzy5Vm5lN5ssWUyfFTmniVs5SBr8V63dyB4dIzOWO9laD++GUy3M0y/ZMJJidVGfu5vTWBpjznxCHIw408L04o/r28c6cwON5gl6TIzJh5w+ePXx2WL2dKf9dBG8Ms006VUwpV9wEmMOEwU4nwFnTDHc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB6982.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(366004)(376002)(346002)(39860400002)(451199024)(186009)(1800799009)(9686003)(6506007)(41300700001)(7696005)(53546011)(5660300002)(26005)(83380400001)(2906002)(4744005)(33656002)(15650500001)(52536014)(107886003)(86362001)(38100700002)(122000001)(38070700005)(82960400001)(8676002)(4326008)(8936002)(71200400001)(966005)(66946007)(55016003)(76116006)(66556008)(66476007)(64756008)(110136005)(66446008)(54906003)(316002)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/7M5TAPAkp7V55CsWeT4hxX/OhSujvDkxchPX9JVtHsy5qNCOX+doR6VGjku?=
 =?us-ascii?Q?F6EZgNHCumYi1oon7NKLMobhHvumGGLneagaATxwl+5ha09kag9zVuMTedkG?=
 =?us-ascii?Q?YMUd5aiXzPyLLI1eUTvM9yfZl6OC+34JvoUjrPzv0uJ29mE9EoWR+IhPLEkH?=
 =?us-ascii?Q?WwqJtUc+fF7qNZzhIIKgLerq2wUk2Mgbzhz0gvJvQZxModdu7UF6h0za3sBM?=
 =?us-ascii?Q?5ZVuFQQ8ZBm4YXpXEouow2brI3VPhaFCuB6KLRlaylP25jaug/mbH31AgQQ9?=
 =?us-ascii?Q?YdYPFMC59dMzuXRK9ZJPnNdK1dVpgFla9SlLufuuW65gteXo3G8e9GmRbLNi?=
 =?us-ascii?Q?PDnMNl8nIucjVlFXqbqWywh64VmlCWT4D3yVtCGdgrs3ipLmg1duD+UyUKHu?=
 =?us-ascii?Q?ZF7E2DZfkLtGMwspQicmJK1QAWNcKlu8HYpaCx3PO+7eVDKeUUCI542dpmBS?=
 =?us-ascii?Q?L3HasmZJpXNZQj/Jzv6jCR5ETb5lqt7X+OKU2kfRmZ56GcFTvHqavJJbolz7?=
 =?us-ascii?Q?OutF6hp2gBkWpoDmlHv3u5Suu95F2NNbdgirsRp7BDvOdYGJ/nl+YlU3Q5/J?=
 =?us-ascii?Q?+kqGaTIxCtucpHIO5oMdqDyszeLyUdughp98fujzTnSBNnHx7s1eYfj57e2b?=
 =?us-ascii?Q?gQnr0hYqhrNaHHie33DmaKnA8h9jZnp3tGrHs9N9axYe2F+oXKWni9bzIzh2?=
 =?us-ascii?Q?XiqNU7sI4oPmvx0HACsIbvA2G73/xHKA2uszVsAbJfX3kmdqZRFMDJfyIDQN?=
 =?us-ascii?Q?0sHkmWnhOulNLsr5LGL4+VencS2RkNB05dNGiFsvDKASkJgg5BpjD67uhrFl?=
 =?us-ascii?Q?2Pm4fLPaEDz8CTdwrYz6qEPkl9Nr2Opsonj6KGjvvskOGPGX5mVYhXtRtlZi?=
 =?us-ascii?Q?69ShNq26SS5xwuTYNhTJOR/RZcksITPPxj5kPlanp4ovZZACQWxQfyWyA5Vb?=
 =?us-ascii?Q?ejHJCxhq3FQ5YUXzPwp0Aktz9bao9L6+4avmSx8PCBQoYIYTli1LWdBLC7yJ?=
 =?us-ascii?Q?VQD6tAUHuQ4Rdm6ovqKG/4qwgcUJSGcAe0qruy7BWXrdVD6yzHchjS/kyjSb?=
 =?us-ascii?Q?Z1/Ma0pHuz0okB42k0R7dKSpb9g6dHOp5g22tJcTMncaPX09Y4zE30x1fJ+S?=
 =?us-ascii?Q?j/rtim7wiNPxnH5MpypNA0Ot/9D3D5A5+e0ze5HtWeoE1tT1rTor4mt4RKYY?=
 =?us-ascii?Q?RMCI19OcIld7G5CWK2ChRooKQlauZ1Pcdls+qmX7WCq7Udkc2jm/iNgqnh9l?=
 =?us-ascii?Q?9MUVOKSZu3Fkqspa0Xpcypd/8H/Ls2Q2BxTcWK537zSRjuUmwF3hocIyofcT?=
 =?us-ascii?Q?oiQAmsHlwcjG0hPMbvnDB0/7pYf9J+jBYaRVRyPedu2qZlG61ADMJ+4LMARE?=
 =?us-ascii?Q?fcLpOso+N+EHD4QTgS9yXa/92DoHja/b1fkOVNt9iAmWwmStARRQo9lJ+5go?=
 =?us-ascii?Q?/SmiB4DS64Osc2GcYtCejtIYEfyHsOh/BcbtEszcQzAJMF/YDqvnnXmDorqe?=
 =?us-ascii?Q?3hlVUMRWIwhx7UdpgjHXHSBeNpJ4t/VZ9fBbD4vnu1H9OetlreiChISLEgmp?=
 =?us-ascii?Q?cOVkSNDjyBAIhs4/3qc6tgUEE9UqKtOghDmZImvN?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6982.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34fb77ba-c1cd-41ea-5771-08dba3b6601a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2023 08:53:09.4421
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jCW4KklsjMto99NR1dqKhMDISxy0Ukg3pg61jQp/ymVdMyTSJtoMxSWrvdD9Rt8xSCxuunkjXH0AykM0wv1EJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6918
X-OriginatorOrg: intel.com

Hi Adam,=20

> -----Original Message-----
> From: Guerin, Adam <adam.guerin@intel.com>
> Sent: Tuesday, August 22, 2023 7:41 PM
> To: linux-firmware@kernel.org
> Cc: Trahe, Fiona <fiona.trahe@intel.com>; Schuetze, Joel D <joel.d.schuet=
ze@intel.com>; Cabiddu,
> Giovanni <giovanni.cabiddu@intel.com>; Guerin, Adam <adam.guerin@intel.co=
m>
> Subject: [PATCH] linux-firmware: update qat firmware
>=20
> Update qat firmware for Intel qat_4xxx device
>=20
> Firmware information here:
> https://intel.github.io/quickassist/RN/In-Tree/index.html
>=20
> SHA256 Checksum of qat_4xxx.bin
> 893caab5ce46e590c89e1dc434a28cd24a4b2405c2e63ddde6185223a3d53fba
>=20
Can you please also add the version of the package that the firmware was ta=
ken from.
