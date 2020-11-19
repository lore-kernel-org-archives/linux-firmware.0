Return-Path: <SRS0=wEzN=EZ=intel.com=kiran.k@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6776C2D0E4
	for <linux-firmware@archiver.kernel.org>; Thu, 19 Nov 2020 11:37:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A42E7246EE; Thu, 19 Nov 2020 11:37:01 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A94F246CA
	for <linux-firmware@kernel.org>; Thu, 19 Nov 2020 11:37:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.b="Pvik7nH2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A94F246CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=kiran.k@intel.com
IronPort-SDR: HOQm511ieUuD0T2UiLlXYIoJ0SWWMKKALbE0nvhWdBZOIroHSCGd9Cn6ksODZsX1DuJ68ggGiy
 jkt0T/IzE9Wg==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="171372325"
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; 
   d="scan'208";a="171372325"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2020 03:37:00 -0800
IronPort-SDR: 6Bvf1bF/n9xS6Gw+HL45fKLwuHr5RywZuBLk8dSOA16B3feqdXNvB/sX4ZnJ4/5yCBoWJ9jw0/
 XgE55QUOMGpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; 
   d="scan'208";a="311038204"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
  by fmsmga008.fm.intel.com with ESMTP; 19 Nov 2020 03:36:59 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 19 Nov 2020 03:36:59 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 19 Nov 2020 03:36:58 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 19 Nov 2020 03:36:58 -0800
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (104.47.37.53) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 19 Nov 2020 03:36:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lh7goGIGzA5XnlOZ0BnAoxlpXPO0rJ253bv6OKlcFtR3sMUtg31OuL5R4CAlNaPlZOmNvBWBI4Dql2R6XN4KdMFSOPQVEfJuOKRa0gF/YRH5mRxGwQp16GK/c29io4n0/bOyykMBaSk4RkRKH3n7Mq83OSlik+MQt5hDcnKxVNGGCNXwIve0TLB6Npe2WAlzVOD4pQCCZkua9hAGd3kusrY2UyB7V7KZ16KTY67AQ1/z+hqV3XR70Ehx7f4/mL4pwW0lrmUYx3QKV0jCcBktACn2Eu32DuLmo4RNZXXWIybfX35Zei+rTRFa1FYle8FlGqOukpamevItjRR2AxGOWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7VsjrgX8/35Krw7Q7YSiWSwARe2rDsQXog089RpXQKY=;
 b=Dxlu5d9reVxim1uEHxST9fKBWEIZFx1eUIO6OqmVzaUZWDcbdMK+xPMCFPwUxk9fALqlPWznurFjNz7HrWoSrHZfDAflfdrKmmkj6+OVYy2/Ph1hJs9COIK2ZWKjPOz/vDcVy0b+6qEumOjfhpxrGwbu4sVgPq3Sr/1ulaqX3QIDLDF+eBhGq2ij/5VnR5BSv3dMtWfmPoKjOKNZUga0Xr9t58qVPoZZjPkFtAvmYSibh2zsosUiZYAhX1BQhqZzE2Nzk2Oi75Ndu2MhSTYg/EwIKAaxvG9sl+9jqf7IrKo/N6j/tFJTw8okOvGYJ9roh1IlcRWzeuit5mRPBTXkeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7VsjrgX8/35Krw7Q7YSiWSwARe2rDsQXog089RpXQKY=;
 b=Pvik7nH2uxE3akwFCWXJO9CkfEtuYT6bgLYErvVkELqspUei9DYO6lzTeqESqvQP93czgqSFhc2bL8iSneV3ND6cdMPjgLoA6Oq+1SXfH2R5z30ojEtSmWhvYOT1Oiec5/zjkEdZnv/FUV+RPlgZiQADuxarE07m3xsMB5z9bmQ=
Received: from BYAPR11MB3141.namprd11.prod.outlook.com (2603:10b6:a03:8d::13)
 by SJ0PR11MB5213.namprd11.prod.outlook.com (2603:10b6:a03:2da::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Thu, 19 Nov
 2020 11:36:57 +0000
Received: from BYAPR11MB3141.namprd11.prod.outlook.com
 ([fe80::85cf:4ba6:9402:b396]) by BYAPR11MB3141.namprd11.prod.outlook.com
 ([fe80::85cf:4ba6:9402:b396%5]) with mapi id 15.20.3564.028; Thu, 19 Nov 2020
 11:36:57 +0000
From: "K, Kiran" <kiran.k@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: "Srivatsa, Ravishankar" <ravishankar.srivatsa@intel.com>, "Tumkur Narayan,
 Chethan" <chethan.tumkur.narayan@intel.com>, "Narasimman, Sathish"
	<sathish.narasimman@intel.com>
Subject: RE: [PATCH v8 1/5] Bluetooth: btintel: Fix endianness issue for TLV
 version information
Thread-Topic: [PATCH v8 1/5] Bluetooth: btintel: Fix endianness issue for TLV
 version information
Thread-Index: AQHWvmfOVhoYHpxIJkSEVH+2CtxrVqnPU0wg
Date: Thu, 19 Nov 2020 11:36:56 +0000
Message-ID: <BYAPR11MB314132F885B4EA68DC4C31F2F5E00@BYAPR11MB3141.namprd11.prod.outlook.com>
References: <20201119113450.13771-1-kiran.k@intel.com>
In-Reply-To: <20201119113450.13771-1-kiran.k@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [122.171.175.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f1f6ccef-2278-4cc5-27c1-08d88c7f6bcb
x-ms-traffictypediagnostic: SJ0PR11MB5213:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR11MB521387592A109377F97E30ABF5E00@SJ0PR11MB5213.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: szjx6DPf9FV6zDuTsOABRkOckMb7a/udy3tH8m9R1Gi0n8qxco1r7Wa0lWaDb7z1eQI6H7yBjFY71kl1upzwAeaDcM4jgOqZaWIQXaArzC8OLS3PcMMoBsBBrfdkNKRImpwdKZqb2ZgkdVoAQ0TTsxSECkXBvN/9F3D2kpklqOkyLGK6mZ8kmtyOQJdboIGnQsSdzavg1q6F3r0GdY7Pj17kg9mpLRnbecyaU20ssGGkm40Z1bgrxG/9HVbPhhBHqcX6QF1LQnsHSNPw8mIxmLnpop/VgCcFo2dJSZFQ60vvQ9J5pwV36j3fxZhhPktlbdUk7kW6wbpa4Zix111jEw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3141.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(8936002)(2906002)(53546011)(71200400001)(6506007)(8676002)(52536014)(7696005)(5660300002)(86362001)(66556008)(64756008)(66446008)(66476007)(66946007)(76116006)(316002)(54906003)(26005)(186003)(83380400001)(6916009)(478600001)(9686003)(107886003)(33656002)(55016002)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: qr4iaIByYka5EFuaMxM/jYIVfkcZ/JaYhIalOjFRm76vuN7h5LEm2slsrjVMGYX+vpp/aSIkxrXiAaeWAt7b5nPv731u8q4b/NjJumTAITP4/7t4HR9yMneFB5olEWr31kwJfz5dhHevJ20YwMJlgTRbxLsnraqXGJJ+UMQtRIsmanjZvscsFwfNNWcy2opguIAHesXgAKqoldNSwDk7hvnq3FkVvTqNiNwZq5Hz84sTSA5K8b5YUlstEy6XTHOyuWlTgxWGOxypcPS8IP4EmwBIAupdEHAETHzhRakH/st/okZ7yWVOsBusLHT49+qzcPtUMGEseFmm1slCRQK/e6cXs8KJb76Uc4w0ER+454dNG1B9U8DiDcoh0X+SQ3jLAOxF2pRQPB6B5jjZWEVBCVF6WBi9Ub7BOV9Pa00VPmL/K+4G5/M352yogJP55yqsV2YQJVf5L2Py4kaNy3FoAGLFCtnTxj06OMBXFnMmSubOr+Q8L5xJ35CQEplCa+W/9joHSWavQJmh0iPclgW0/NUOwzMcTnS0Tj4H5jcI+T6/OU7MckFhOdnvTtSCWvy9L9Rn31xQAGvhkdxaQtV8GeVPWcgK61HIMH7m1Eb7bzv1bir2Oz4ZqFOdFaHkAz4S+db8K4QT/4is1JVgvZ9yJ1GjFff3djCJZZaiazitOHrofWuU9kcYn7ddr0ovTO9lN66duTvW3izaUogPVEbGVPmBXLyzL3nVxvQc2BGd9GWqVByE7sHhkrQrajNen+7anWoJxtFJus0L6YNBcFBqnLXIWCyg6kLW6jgA8oeEqIOAy3iY0BfigHpdB8pP0iykmtEdHQzYQTbkPPtOhRQz/nJC235Cs/cDTfMwwl7ddKRa7zLuF9i18d42PoziZqK7Z9/Wp3edhiAVRQaFI5r5NA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3141.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1f6ccef-2278-4cc5-27c1-08d88c7f6bcb
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2020 11:36:56.8277
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t4hcRubJF45wze/FvBWYq0XQD/onoC93NM+Sps9s2+kqRXw16mhI29uBgmJvb4eC5rWUZOdWZ0ONGi5RhQaenA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5213
X-OriginatorOrg: intel.com

Hi,

Please ignore this patchset.  By mistake I sent to the incorrect mailing li=
st.

Thanks,
Kiran


> -----Original Message-----
> From: K, Kiran <kiran.k@intel.com>
> Sent: Thursday, November 19, 2020 5:05 PM
> To: linux-firmware@kernel.org
> Cc: Srivatsa, Ravishankar <ravishankar.srivatsa@intel.com>; Tumkur
> Narayan, Chethan <chethan.tumkur.narayan@intel.com>; Narasimman,
> Sathish <sathish.narasimman@intel.com>; K, Kiran <kiran.k@intel.com>
> Subject: [PATCH v8 1/5] Bluetooth: btintel: Fix endianness issue for TLV
> version information
>=20
> do __le32_to_cpu to tlv data fields to make sure driver runs correctly wh=
en
> running on big endian system.
>=20
> Signed-off-by: Kiran K <kiran.k@intel.com>
> Reviewed-by: Chethan T N <chethan.tumkur.narayan@intel.com>
> Reviewed-by: Srivatsa Ravishankar <ravishankar.srivatsa@intel.com>
> ---
>  drivers/bluetooth/btintel.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/bluetooth/btintel.c b/drivers/bluetooth/btintel.c in=
dex
> 88ce5f0ffc4b..41ff2071d7ef 100644
> --- a/drivers/bluetooth/btintel.c
> +++ b/drivers/bluetooth/btintel.c
> @@ -437,31 +437,38 @@ int btintel_read_version_tlv(struct hci_dev *hdev,
> struct intel_version_tlv *ver
>  		tlv =3D (struct intel_tlv *)skb->data;
>  		switch (tlv->type) {
>  		case INTEL_TLV_CNVI_TOP:
> -			version->cnvi_top =3D get_unaligned_le32(tlv->val);
> +			version->cnvi_top =3D
> +				__le32_to_cpu(get_unaligned_le32(tlv->val));
>  			break;
>  		case INTEL_TLV_CNVR_TOP:
> -			version->cnvr_top =3D get_unaligned_le32(tlv->val);
> +			version->cnvr_top =3D
> +				__le32_to_cpu(get_unaligned_le32(tlv->val));
>  			break;
>  		case INTEL_TLV_CNVI_BT:
> -			version->cnvi_bt =3D get_unaligned_le32(tlv->val);
> +			version->cnvi_bt =3D
> +				__le32_to_cpu(get_unaligned_le32(tlv->val));
>  			break;
>  		case INTEL_TLV_CNVR_BT:
> -			version->cnvr_bt =3D get_unaligned_le32(tlv->val);
> +			version->cnvr_bt =3D
> +				__le32_to_cpu(get_unaligned_le32(tlv->val));
>  			break;
>  		case INTEL_TLV_DEV_REV_ID:
> -			version->dev_rev_id =3D get_unaligned_le16(tlv->val);
> +			version->dev_rev_id =3D
> +				__le16_to_cpu(get_unaligned_le16(tlv->val));
>  			break;
>  		case INTEL_TLV_IMAGE_TYPE:
>  			version->img_type =3D tlv->val[0];
>  			break;
>  		case INTEL_TLV_TIME_STAMP:
> -			version->timestamp =3D get_unaligned_le16(tlv->val);
> +			version->timestamp =3D
> +				__le16_to_cpu(get_unaligned_le16(tlv->val));
>  			break;
>  		case INTEL_TLV_BUILD_TYPE:
>  			version->build_type =3D tlv->val[0];
>  			break;
>  		case INTEL_TLV_BUILD_NUM:
> -			version->build_num =3D get_unaligned_le32(tlv->val);
> +			version->build_num =3D
> +				__le32_to_cpu(get_unaligned_le32(tlv->val));
>  			break;
>  		case INTEL_TLV_SECURE_BOOT:
>  			version->secure_boot =3D tlv->val[0];
> --
> 2.17.1

