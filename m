Return-Path: <SRS0=h/I9=AB=aeonsemi.com=xin.huang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1225DD35666
	for <linux-firmware@archiver.kernel.org>; Wed, 28 Jan 2026 02:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CC90EC116D0; Wed, 28 Jan 2026 02:41:28 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11020135.outbound.protection.outlook.com [52.101.193.135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A8BD6C116C6
	for <linux-firmware@kernel.org>; Wed, 28 Jan 2026 02:41:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A8BD6C116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=aeonsemi.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=aeonsemi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=srK0SFRRlDE5Av4sHGya+v+VIq03YSE9ZUTEQe81Bw2dAyFlElTA9+kswlOjA8t+LqN8n1AQlLmbonEUe1Sc0+hXzJsZXI++TiR4he+4PNpX/Lbf18lrX6sh4EKJdxxXl9M/QaBIMsG/IKsV2fN7eZEqLx8tYaSGmORvjY71uqxRfmEpDXbJ8gg10LSJrzMdz9J1lFO7X+nCgWjWv7T9qWHfiwCckXVfj/O59S6SvjU/cfLVdA12H+ud9K/QzgViTmn8dPQwIdZki1MeGnb17lQ1BXUKjdSZUAMV6VbUU0P4iPquDnGvirwbvDSpmTp7ZuWt4sNFpHEBkRlyAgmcaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qafnXjer5xT/VgpW+0DSQj+Ri0ESyqOmRzU4T5bPH7M=;
 b=w1kydqRaV6NDfjHVZDSN/cIFQYyx0jCNjwoteM1mL1UCLOi9AQtcDS9VzNwvKwnYSXEk5Lzk45/h/9i8xXYabGxfyHkKE7jHyJr2je2GFH2jLzUVvShd8V/uF8DHTOd1pQ7GKviooytjPGBgyFvk15i77erOD/yVTxJJKgvWqvpHh0ZBCkWn9c+eswod+ie0/RVTcB48rihmJprdpjAn5Qzu6p12QCjJyF87+dd8Om1qC0owpYXb9ZCCv/i40IOlsT664Nk0/3GiqoahRuUaQb2p0j0QDBzh424nK4rXnAd6ZsK2QNISZsHkIOJ2dBAIv5E+v4M7YZp4Mg94lY/r1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aeonsemi.com; dmarc=pass action=none header.from=aeonsemi.com;
 dkim=pass header.d=aeonsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aeonsemi.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qafnXjer5xT/VgpW+0DSQj+Ri0ESyqOmRzU4T5bPH7M=;
 b=mlsC8mDOFWN0crwKoI5cNmS6zqBpZlZl1LMEwPBKWONcQa49Bo58okWJ/6OLB+QurGRw80HQlzof32wOzy6f6FN00IH/4PU6QCJY6KkultjQsybZt+lwpTPeE48S+H9wN7zR7tKo/0oGcA0mF7DkuKJhEL3FgJrMIHUYz1uw9PtfnjrOZnFGHZMHmKutphGMj4xe4QWHspCA74Dwc1UbL/gSNriQVRncuv8wHxZ1Y6alCQl+xqJTnCDtWpJXa/d80Hi9Oc+voJ9OU+YC5N7IJ2JFduule9JnfrLWrXMXkYjTQuKEV5uMJioJ9OZcolPFdb+VdSb9CkBa7ZLkolbOow==
Received: from DM3PR19MB8358.namprd19.prod.outlook.com (2603:10b6:8:1af::5) by
 SA1PR19MB6717.namprd19.prod.outlook.com (2603:10b6:806:25c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 02:41:22 +0000
Received: from DM3PR19MB8358.namprd19.prod.outlook.com
 ([fe80::572:369c:3e78:8834]) by DM3PR19MB8358.namprd19.prod.outlook.com
 ([fe80::572:369c:3e78:8834%6]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 02:41:22 +0000
From: Ryan Huang <xin.huang@aeonsemi.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "dmitry.baryshkov@oss.qualcomm.com" <dmitry.baryshkov@oss.qualcomm.com>,
	"Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>,
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>,
	=?utf-8?B?UGV0ZXIgU3RlaW5ow6R1c2Vy?= <ps@embedd.com>, Huajian Zhou
	<huajian.zhou@aeonsemi.com>
Subject:
 =?utf-8?B?5Zue5aSNOiBbUEFUQ0hdIGxpbnV4LWZpcm13YXJlOiB1cGRhdGUgQWVvbnNl?=
 =?utf-8?Q?mi_AS21x1x_firmware_to_1.9.1?=
Thread-Topic: [PATCH] linux-firmware: update Aeonsemi AS21x1x firmware to
 1.9.1
Thread-Index: AQHcimWoEQveNVxUn0Kp1kOQ4ElNerVm5xUAgAAArr8=
Date: Wed, 28 Jan 2026 02:41:22 +0000
Message-ID:
 <DM3PR19MB83582370043EC80A5BE42ECF8691A@DM3PR19MB8358.namprd19.prod.outlook.com>
References: <20260120212659.4454-1-ansuelsmth@gmail.com>
 <htkipxs5s3lmkm65wrgsyouk5hh7iyno4aci6cbu5sba3swnw2@pxgawgx4yzmd>
 <CA+_ehUy-9Gd8x81btYdq1sRpKtGv8BuynbFJz6tTg655pba8Rw@mail.gmail.com>
In-Reply-To:
 <CA+_ehUy-9Gd8x81btYdq1sRpKtGv8BuynbFJz6tTg655pba8Rw@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aeonsemi.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PR19MB8358:EE_|SA1PR19MB6717:EE_
x-ms-office365-filtering-correlation-id: 071a86f5-350a-4dd4-3fe8-08de5e16b97b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|8096899003;
x-microsoft-antispam-message-info:
 =?utf-8?B?NUxtQmlDZ1pVaXJTRExVRnlBd01uVE81STFscXBsYzZ2L3h5bUF1eE5UckxV?=
 =?utf-8?B?eEI0VFlLVGxzZVV0YWR1d0M3dG5HMkNIQkpwcU9oQTg0T2JmeVNoTzNXelY0?=
 =?utf-8?B?a1Q2RHllZ00zSFRhaklOc0NENUNZMjNxcE43cjRZMGprMk9waGc4OEMrbzRq?=
 =?utf-8?B?d0FicVVXRGRtNGpUVFp6UTVsa0RYdTkzalNPZmdaRnVSRXorUEt0U1ZWZlRT?=
 =?utf-8?B?YktRbmZUV003dmpJY0xXWDdnTStUVk1HWVJYT2Y1U2VaMW9WL3RKUDRhZTFp?=
 =?utf-8?B?elpLVlcwS0ViTER0c3dHVEJsZWl6Qmo4VDIva3phL2RsTEpZcThweFZvMU14?=
 =?utf-8?B?MGFydURLdGt1U3JmSFN3NDJ4cytQYlo2Q09hM2dPdStVaGZXNlJmaHp1b2kx?=
 =?utf-8?B?MEU4QzU5YWRCb04rMDBJUDA2cXFTcE9MMVhkQW4ycjF5NFpPN1VMTmFORFcz?=
 =?utf-8?B?dWM2RDd2WHQ0eVViaGc1MXovVDRWU3c4Vi95L3krNS9HbXZ0ekIyUFpkNE1r?=
 =?utf-8?B?VFdmRlQwK1FWeFZUNk9qN3NIMUQrR3V3TFlUelUyakVkdm01OU9YTzNZOUVt?=
 =?utf-8?B?bTlldzlLbUFWZXlHaGtlelRJa0VJUjFOK00xV08wK3V2Smk2ZytQbVhQeUVJ?=
 =?utf-8?B?WGdsL1p2ZTQvTEhXbkRPR2pXc01md0hPbUNWblZrYW0yS0hNakV4Y0ozRVBr?=
 =?utf-8?B?c0NvNWE5OE90SWRCS2RVQktIWVB2TFd1alVHdWpadEFGY25KWU15MWticjBo?=
 =?utf-8?B?VU96czNJMVVBRCt5MnZ2WWZWM25FYWFsNnozT3FzZmtSdXpVUWlXanY2dVAy?=
 =?utf-8?B?VXBrQW1XcC9XU0s1czNCTUpSQ1R0d0h4MXA0aVN2dHBCckJyQmhodkhKd3JP?=
 =?utf-8?B?MmM4TTJvakh2T0pqVVpBb0tIMUZ0S002aEJ3YzVsWnMzM0xSS1lJc3FsSHJN?=
 =?utf-8?B?aTNhWDdTNnlFL1RQM255R0pOMkNBL2JoU2Y4V0tWeGlraGhkMmZSUTR6K0p3?=
 =?utf-8?B?djhGTFlaS25GeGNHRVVwR1J3M3pBd2ZMSVBqU3FicVRCbmlJTk5Pb2NQZXY0?=
 =?utf-8?B?aVM2VVllWGZsVEw1ZTBRZ3lNR1BCemlHYk9xbk9FV3BrNVRpUW91MGxBUUJy?=
 =?utf-8?B?NUJVTURaS1BvQVI3TGpwWHdoRUxRamZGTlpjcDg1Y3QzQlBpc1d3RXRBWlFM?=
 =?utf-8?B?bjJQaWhlZEdDa0xPUkRNMHRWMTdkdVBrY0dtSGRPR3R2NTNtcmtlWk5MbCtU?=
 =?utf-8?B?d2NLS3Vya09yWm1HZVIvNzlXZkw1U1RIbWtVYWNaL0k3YVN5a01FdU1XVHBX?=
 =?utf-8?B?YXNIaHkwZDlTWC9aVE5kOG5MR3NwbDdDZmh3N3VJbWlDS05FdlZPcWhYQWNa?=
 =?utf-8?B?bThvdk5XTyt5SUI0NWhrSWhrZlVKdWxpazNVZWxOTktkRWNFa1ZocmFFUEY1?=
 =?utf-8?B?VnRSTVN4ZlhRK0RlV0QzM3BUTDhMN3Q4b2Y1NGR5SEtwbjg2b3l6Y1QweFFw?=
 =?utf-8?B?TmVTdlNUQ2w5djVTMWN3dmUyTWw2SUdvOWgvSzQ4SGdIVGZXQTAvc08zcFVQ?=
 =?utf-8?B?T2x5aGFHRUhWbWljOTRFTGdLQkxoQnd4QkxRWEk2d0hXekpHbmtCbTV2ZEEz?=
 =?utf-8?B?Q04zUXAyQU54OXZZZ2YrZ3hlaTRKRUJXaHU4ZTRpNjVod0xYQ2Y1REtxKzcw?=
 =?utf-8?B?THdKeWdIWStVK1RTbDN0dDJhS0JVdHJDVGZqQ2hlNWpHTFQ4ZUcrYk82ajln?=
 =?utf-8?B?OUJXeTFxam1OZ3ppUGZMTVFPMjVQZ0swWjR3UmRVbHRXYTd4Y2JvajRJOHha?=
 =?utf-8?B?N0JwOTE3eGZ5S2F0aGc0NitzVGJVSnppTHhQTXM3YWJGVkdVcTdBUWtubkta?=
 =?utf-8?B?L2lPbnJ4RDBQK1FqM0oyeFdrN0RQRmdiWjROR2V6RmZJdkR6SStRUkdwWHRO?=
 =?utf-8?B?ZWpHSVY0ZnlOYjMrQnFkdjBVVU5CdlFBZjZvS2RLeE56ckh6aUVuTG9aaG9i?=
 =?utf-8?B?ai9OSmJESzlRdGZ0UWRMdERYNlVGS1ZnZDNFam1oeG5BS0hBL3JZVGNmTUZK?=
 =?utf-8?B?MS9jNUhzV1RMVE5sZUl0Slc1amloNndkaGtSTlRHUndKS1R0cWkvb0VNeWth?=
 =?utf-8?B?YzZWTEthTmVNYnZXcUlrVno4ZEVjZjRwVXdIS0R6d0JieUhMY3dSMlgxWVhW?=
 =?utf-8?Q?tusd8s82fNXNHq8Ih8q2MF4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR19MB8358.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(8096899003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NktMOEJ4QlNLUkpuK05mQWpnM1I0OXh0TzhYZ2RrTXYwK3dRTHAxWHVmN0Jr?=
 =?utf-8?B?cERzWFA5cUNlRDdQeWFUcExFd0t1N1RocFFHdHFhOTZlOEJXN24weXFKZlBh?=
 =?utf-8?B?cCtvWGFmWitmSnZIK3BucGFQbDlTbVN3aUJjSFcrajUvbHhPWkQvR284bXNi?=
 =?utf-8?B?S0owMFJDVFhEd1RoSFhBNjU0dHVZd2pwTmNhOUxEM2RvL1NIUlNiTVZSQlVV?=
 =?utf-8?B?TEFtK3N2czhFUjB2ZGltM0tFMzg2enEzMjBzNkkvU1B6SkFoMEN0WUNGeWRq?=
 =?utf-8?B?UkNFekVScmZPYUNKQ2VpT29QdGQ2UzNOaEhYTTZtdmtqTTk3V2FBMXVUNWox?=
 =?utf-8?B?S1Rzbm0wUlMwS2pMWlRka0RFb0VNcE12VlNyVUZZQnFxS051cEhFWjltN3RL?=
 =?utf-8?B?cmpHS1paSkh5KzlKUmd4SDI0dm5TdHdqNUdDN2FhOGRHRjJqQzdlUTMyV0gr?=
 =?utf-8?B?K0dSb09mR2gwZHZZM04yaGVBSnBqcHM1aklGbjB0SEs0WStpazdGbzZoMk5k?=
 =?utf-8?B?N3ZHYTU2WWFQcitmOVFrbWg0WUw4S2xQOHFiaDZvT3FTdGsyWENkTkxnZUZk?=
 =?utf-8?B?bk1aS1R0TG9MSEVBK0V2bXFkc0lxakZGak9LYmdOK1JscnlkVzBYRVQrZ0FV?=
 =?utf-8?B?dmZwNE1MUmxid1RhRis0Rk94MWoxNy9uL3pjU08reWdHQzlSSHNObU0vT0Z2?=
 =?utf-8?B?NE4vaGYrUmdWbHJEUUpNRWkxZmNZVFYxakJxdkpjMHphWUUrWnlCN0svaWFN?=
 =?utf-8?B?WmFVV3pQaFBnMDJoR0NzeXpISytCdVAzYW1PZy93bWg0cUkwZmJoS2Q0Q2pE?=
 =?utf-8?B?UmxzTE5OcWNVUHdLVWZmZVJuSE52VTJhTVBmQURadFpuTUZubCsrMTBkM2p0?=
 =?utf-8?B?aG1TTWpGOU5jK3lQdEVKVEE4QmdWUTAzRW1iQXBGMEJKaUNDYmZPYmovaGUz?=
 =?utf-8?B?RDNyVWlkUU1DbzNsUSsxKzNEMjZ4Q2sxUERGRTdkd0djTk9WMU84b2EzaGda?=
 =?utf-8?B?djRYaEpCZCtRdndnano3RHJqTXd1U0U4OTEzWlVveFRXa3NCOUpnYVd0Z2RC?=
 =?utf-8?B?VVNMaENuQkhJTFVjOFNSeE1PNTYwamowK2pGY3dIRW1tRm1KL0xUZnl2dXEy?=
 =?utf-8?B?T3NpT05MOHBrSDdNdENLaFJlZVNyaHRGVWVtWlc0QjhNdTRZMCtGMlhUU3lY?=
 =?utf-8?B?V0wzTTVWczFzTi9peVlJbUZ5WnJnWjJhdG5rNDhJcFZyRG40RDJmbHJwak5P?=
 =?utf-8?B?ViswSCs3alJrM2NHamp4V21XS0R1T0ZMQnh3aHZIRzJydHg4eFRpT1lHbzJh?=
 =?utf-8?B?SmdoUDFSMEw5WU1FeVYxTE9NL3M1UjhxbzJja2IrS0VDMVkwTEJKcjVLQnFW?=
 =?utf-8?B?MnZob2tmZDFRdnFBbGdEMDFTZGY2Mmp2VDdzQ3JGSGp0bzRvMkdOVkpvSFNx?=
 =?utf-8?B?RlBMNGozb0k3am5JZzJOY0Nwb0hwZnhXMHZISDRFZDM4c0Z5ZjhBWkZ5R0xp?=
 =?utf-8?B?bUVsWm15OGRDVnpTa2cvZ1hXVUQzOUZZbEZGRWQ1UTE2d2J5Mm5Na0RwRTg2?=
 =?utf-8?B?azZIbHYrZ29oV0txQk9EZS9RMVN2dk0zUmc0UW1vTTJ0RzFGcThObVF6L3lO?=
 =?utf-8?B?RWlEeDN3T0ZEWFQ4TWZ3bTgwWG1sQnRiTkFpd05NK0o5ditYZjYzb0RkSnVl?=
 =?utf-8?B?NGVmVXhCN0FjMGhySk5sQXREUDcxQzJhZkFOWUxEK1o0S1FhdVg4MTRLQTdr?=
 =?utf-8?B?ZXZrWktDTHUvOWo2Tk5HaytzelhkeGJQLy9iQlo5aGFKcFJMaXBOUGNPeEtp?=
 =?utf-8?B?OHRaTmVJNlJqelJwUmQvWHZ3WUQ2TDVnSjBRRG1KK3l2UnhrZ3IwMEp4Smw3?=
 =?utf-8?B?SG1YSU1mQzF0UFd1dkt6NE9RR2R6dytCWmkrcTZiT2tlcjIwQmJFRitBRlll?=
 =?utf-8?B?VDhNUE9vdk9kOVpmSzRVaDNHSUQweVhKUWFEdm1va09ZVDNJR0xkUU5iMWxU?=
 =?utf-8?B?NldWNnpHRUltQU01L0Ywb0NkSEsxQmVqaHlwY2VHcm9PcDRJL3ZNQWdEajZ0?=
 =?utf-8?B?OVpDZkNPSXY5RkUwTFBoazFYOFYwYlNhaHFBZ2FreEpYTkxQOVM2ZFBIc0hk?=
 =?utf-8?B?aE1ZZWswdnZMckRycE0vRTA3a1p5UWcweHErdkZuQ0U2bjA5eFZLSmVtd3dI?=
 =?utf-8?B?NExDK1hkRytjUDZVTGo2dXZhUzdoVWZLNXRoakhyZTArOFkrSmtSTmMyWlE5?=
 =?utf-8?B?eGpTek9DRUhlU2tMMjAzRE9GZS90REJQMkdMajhUTlV3NXZXbE5FaFZIalBH?=
 =?utf-8?B?dWVqWTl1a3JOWDJMbVZnZ2Y4L20vNUc3d1dmVndXTnNGMjVhM1RaZz09?=
Content-Type: multipart/alternative;
	boundary="_000_DM3PR19MB83582370043EC80A5BE42ECF8691ADM3PR19MB8358namp_"
MIME-Version: 1.0
X-OriginatorOrg: aeonsemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PR19MB8358.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 071a86f5-350a-4dd4-3fe8-08de5e16b97b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2026 02:41:22.7319
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9c152b5-484f-4354-abbf-32c59cde3923
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sdNfbzB/T9V/OhyHP0JU9RhRNhx+EGHGGG9DlmkiXOuF5SnHAG5GiS2tKrYxEgtdU60THckoBzJ5/N6cGU1GAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB6717

--_000_DM3PR19MB83582370043EC80A5BE42ECF8691ADM3PR19MB8358namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgYWxsLA0KDQpZZXMuIHRoaXMgcGF0Y2ggaXMgaW50ZW50aW9uYWxseSBjb250cmlidXRlZCB0
byB0aGUgbGludXgtZmlybXdhcmUgcmVwbyBhbmQgdGhlcmUgaXMgYW4gdXBzdHJlYW0gZHJpdmVy
IHN1Ym1pdHRlZCB0byB0aGUgTGludXgga2VybmVsIHRoYXQgd291bGQgbG9hZCB0aGlzIGZpcm13
YXJlLiB0aGFua3MuDQoNCg0KDQpCZXN0IFJlZ2FyZHMsDQoNClJ5YW4gSHVhbmcNCg0KKzg2LTE1
MzY2MDA2MDg0DQoNCg0KDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQrlj5Hk
u7bkuro6IENocmlzdGlhbiBNYXJhbmdpIChBbnN1ZWwpIDxhbnN1ZWxzbXRoQGdtYWlsLmNvbT4N
CuW3suWPkemAgTogMjAyNiDlubQgMSDmnIggMjgg5pelIOaYn+acn+S4iSAxMDoyOQ0K5pS25Lu2
5Lq6OiBSeWFuIEh1YW5nIDx4aW4uaHVhbmdAYWVvbnNlbWkuY29tPg0K5Li76aKYOiBGd2Q6IFtQ
QVRDSF0gbGludXgtZmlybXdhcmU6IHVwZGF0ZSBBZW9uc2VtaSBBUzIxeDF4IGZpcm13YXJlIHRv
IDEuOS4xDQoNCk9uIFR1ZSwgSmFuIDIwLCAyMDI2IGF0IDEwOjI2OjQ3UE0gKzAxMDAsIENocmlz
dGlhbiBNYXJhbmdpIHdyb3RlOg0KPiBVcGRhdGUgQWVvbnNlbWkgQVMyMXgxeCBmaXJtd2FyZSB0
byB2ZXJzaW9uIDEuOS4xDQo+DQo+IFRoaXMgbmV3IHZlcnNpb24gaW50cm9kdWNlIG5ldyBjb21t
YW5kIHRvIGNvbmZpZ3VyZSB0aGUgRFBDIFJhdGUNCj4gQWRhcHRpb24gdG8gYmV0dGVyIGNvbmZp
Z3VyZSB0aGUgSW4gQmFuZCBzdXBwb3J0Lg0KPg0KPiBBbHNvIGludHJvZHVjZSBzb21lIGZpeHVw
IGZvciBzb21lIHNwZWNpZmljIHNjZW5hcmlvOg0KPg0KPiAtIDEwRyBwZXJmb3JtYW5jZSBpcyBv
cHRpbWl6ZWQgZm9yIHVuc3RhbmRhcmQgUko0NSB3aXRoIFdJRkkgZmlsdGVyDQo+IC0gMTAwbWV0
ZXIgMTBHIHBlcmZvcm1hbmNlIGlzIGltcHJvdmVkIGZvciBzZXR1cCBvZiBzZXJpYWwgcmVzaXN0
b3Igb24gTURJIHRyYWNlDQo+IC0gQXV0byBjcm9zc292ZXIgaW4gZm9yY2UgMTAwTSBtb2RlIC8g
cGFyYWxsZWwgZGV0ZWN0aW9uIGlzc3VlIGZpeGVkDQo+DQo+IChxdW90ZWQgZnJvbSBBZW9uc2Vt
aSByZWxlYXNlIG5vdGljZSkNCg0KQ2FuIHdlIHBsZWFzZSBnZXQgQWVvbnNlbWkncyBhY2sgb24g
dGhlc2UgY2hhbmdlcz8NCkkgQ0MnZCBSeWFuIEh1YW5nLg0KDQo+DQo+IFNpZ25lZC1vZmYtYnk6
IENocmlzdGlhbiBNYXJhbmdpIDxhbnN1ZWxzbXRoQGdtYWlsLmNvbT4NCj4gLS0tDQo+ICBhZW9u
c2VtaS9hczIxeDF4X2Z3LmJpbiB8IEJpbiAyNjE0MDAgLT4gMjkwMjcyIGJ5dGVzDQo+ICAxIGZp
bGUgY2hhbmdlZCwgMCBpbnNlcnRpb25zKCspLCAwIGRlbGV0aW9ucygtKQ0KDQotLQ0KV2l0aCBi
ZXN0IHdpc2hlcw0KRG1pdHJ5DQo=

--_000_DM3PR19MB83582370043EC80A5BE42ECF8691ADM3PR19MB8358namp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4NCjwvaGVhZD4NCjxib2R5IGRpcj0ibHRyIj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBB
cHRvcywgQXB0b3NfRW1iZWRkZWRGb250LCBBcHRvc19NU0ZvbnRTZXJ2aWNlLCBDYWxpYnJpLCBI
ZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTFwdDsgY29sb3I6IHJnYigwLCAwLCAw
KTsiIGNsYXNzPSJlbGVtZW50VG9Qcm9vZiI+DQpIaSBhbGwsPC9kaXY+DQo8ZGl2IHN0eWxlPSJm
b250LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVkZGVkRm9udCwgQXB0b3NfTVNGb250U2Vydmlj
ZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDExcHQ7IGNvbG9y
OiByZ2IoMCwgMCwgMCk7IiBjbGFzcz0iZWxlbWVudFRvUHJvb2YiPg0KPGJyPg0KPC9kaXY+DQo8
ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVkZGVkRm9udCwgQXB0b3Nf
TVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6
IDExcHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7IiBjbGFzcz0iZWxlbWVudFRvUHJvb2YiPg0KWWVz
LiB0aGlzIHBhdGNoIGlzIGludGVudGlvbmFsbHkgY29udHJpYnV0ZWQgdG8gdGhlIGxpbnV4LWZp
cm13YXJlIHJlcG8gYW5kIHRoZXJlIGlzIGFuIHVwc3RyZWFtIGRyaXZlciBzdWJtaXR0ZWQgdG8g
dGhlIExpbnV4IGtlcm5lbCB0aGF0IHdvdWxkIGxvYWQgdGhpcyBmaXJtd2FyZS4gdGhhbmtzLjwv
ZGl2Pg0KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZvbnQs
IEFwdG9zX01TRm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9u
dC1zaXplOiAxMXB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyIgY2xhc3M9ImVsZW1lbnRUb1Byb29m
Ij4NCjxicj4NCjwvZGl2Pg0KPGRpdiBjbGFzcz0iZWxlbWVudFRvUHJvb2YiIGlkPSJTaWduYXR1
cmUiPg0KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZvbnQs
IEFwdG9zX01TRm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9u
dC1zaXplOiAxMXB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyIgY2xhc3M9ImVsZW1lbnRUb1Byb29m
Ij4NCjxicj4NCjwvZGl2Pg0KPHAgc3R5bGU9InRleHQtYWxpZ246IGp1c3RpZnk7IG1hcmdpbjog
MGNtOyBmb250LWZhbWlseTog562J57q/OyBmb250LXNpemU6IDEwLjVwdDsiIGNsYXNzPSJlbGVt
ZW50VG9Qcm9vZiI+DQo8c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6IENhbGlicmksIHNhbnMtc2Vy
aWY7IGZvbnQtc2l6ZTogMTFwdDsiPkJlc3QgUmVnYXJkcyw8L3NwYW4+PC9wPg0KPHAgc3R5bGU9
InRleHQtYWxpZ246IGp1c3RpZnk7IG1hcmdpbjogMGNtOyBmb250LWZhbWlseTog562J57q/OyBm
b250LXNpemU6IDEwLjVwdDsiIGNsYXNzPSJlbGVtZW50VG9Qcm9vZiI+DQo8c3BhbiBzdHlsZT0i
Zm9udC1mYW1pbHk6IENhbGlicmksIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTFwdDsiPlJ5YW4g
SHVhbmc8L3NwYW4+PC9wPg0KPHAgc3R5bGU9InRleHQtYWxpZ246IGp1c3RpZnk7IG1hcmdpbjog
MGNtOyBmb250LWZhbWlseTog562J57q/OyBmb250LXNpemU6IDEwLjVwdDsiIGNsYXNzPSJlbGVt
ZW50VG9Qcm9vZiI+DQo8c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6IENhbGlicmksIHNhbnMtc2Vy
aWY7IGZvbnQtc2l6ZTogMTFwdDsiPis4Ni0xNTM2NjAwNjA4NDwvc3Bhbj48L3A+DQo8cCBzdHls
ZT0ibWFyZ2luOiAwY207IGZvbnQtZmFtaWx5OiBDYWxpYnJpLCBzYW5zLXNlcmlmOyBmb250LXNp
emU6IDExcHQ7IiBjbGFzcz0iZWxlbWVudFRvUHJvb2YiPg0KJm5ic3A7PC9wPg0KPC9kaXY+DQo8
ZGl2Pjxicj4NCjwvZGl2Pg0KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IENhbGlicmksIEFyaWFs
LCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAw
LCAwKTsiPg0KPGJyPg0KPC9kaXY+DQo8aHIgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazsg
d2lkdGg6IDk4JTsiPg0KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IENhbGlicmksIEFyaWFsLCBI
ZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAw
KTsiPg0KPGI+5Y+R5Lu25Lq6OjwvYj4mbmJzcDtDaHJpc3RpYW4gTWFyYW5naSAoQW5zdWVsKSAm
bHQ7YW5zdWVsc210aEBnbWFpbC5jb20mZ3Q7PGJyPg0KPGI+5bey5Y+R6YCBOjwvYj4mbmJzcDsy
MDI2IOW5tCAxIOaciCAyOCDml6Ug5pif5pyf5LiJIDEwOjI5PGJyPg0KPGI+5pS25Lu25Lq6Ojwv
Yj4mbmJzcDtSeWFuIEh1YW5nICZsdDt4aW4uaHVhbmdAYWVvbnNlbWkuY29tJmd0Ozxicj4NCjxi
PuS4u+mimDo8L2I+Jm5ic3A7RndkOiBbUEFUQ0hdIGxpbnV4LWZpcm13YXJlOiB1cGRhdGUgQWVv
bnNlbWkgQVMyMXgxeCBmaXJtd2FyZSB0byAxLjkuMQ0KPC9kaXY+DQo8ZGl2IHN0eWxlPSJmb250
LWZhbWlseTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXpl
OiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQo8YnI+DQo8L2Rpdj4NCjxkaXYgc3R5bGU9
ImZvbnQtc2l6ZTogMTFwdDsiPk9uIFR1ZSwgSmFuIDIwLCAyMDI2IGF0IDEwOjI2OjQ3UE0gKzAx
MDAsIENocmlzdGlhbiBNYXJhbmdpIHdyb3RlOjxicj4NCiZndDsgVXBkYXRlIEFlb25zZW1pIEFT
MjF4MXggZmlybXdhcmUgdG8gdmVyc2lvbiAxLjkuMTxicj4NCiZndDs8YnI+DQomZ3Q7IFRoaXMg
bmV3IHZlcnNpb24gaW50cm9kdWNlIG5ldyBjb21tYW5kIHRvIGNvbmZpZ3VyZSB0aGUgRFBDIFJh
dGU8YnI+DQomZ3Q7IEFkYXB0aW9uIHRvIGJldHRlciBjb25maWd1cmUgdGhlIEluIEJhbmQgc3Vw
cG9ydC48YnI+DQomZ3Q7PGJyPg0KJmd0OyBBbHNvIGludHJvZHVjZSBzb21lIGZpeHVwIGZvciBz
b21lIHNwZWNpZmljIHNjZW5hcmlvOjxicj4NCiZndDs8YnI+DQomZ3Q7IC0gMTBHIHBlcmZvcm1h
bmNlIGlzIG9wdGltaXplZCBmb3IgdW5zdGFuZGFyZCBSSjQ1IHdpdGggV0lGSSBmaWx0ZXI8YnI+
DQomZ3Q7IC0gMTAwbWV0ZXIgMTBHIHBlcmZvcm1hbmNlIGlzIGltcHJvdmVkIGZvciBzZXR1cCBv
ZiBzZXJpYWwgcmVzaXN0b3Igb24gTURJIHRyYWNlPGJyPg0KJmd0OyAtIEF1dG8gY3Jvc3NvdmVy
IGluIGZvcmNlIDEwME0gbW9kZSAvIHBhcmFsbGVsIGRldGVjdGlvbiBpc3N1ZSBmaXhlZDxicj4N
CiZndDs8YnI+DQomZ3Q7IChxdW90ZWQgZnJvbSBBZW9uc2VtaSByZWxlYXNlIG5vdGljZSk8YnI+
DQo8YnI+DQpDYW4gd2UgcGxlYXNlIGdldCBBZW9uc2VtaSdzIGFjayBvbiB0aGVzZSBjaGFuZ2Vz
Pzxicj4NCkkgQ0MnZCBSeWFuIEh1YW5nLjxicj4NCjxicj4NCiZndDs8YnI+DQomZ3Q7IFNpZ25l
ZC1vZmYtYnk6IENocmlzdGlhbiBNYXJhbmdpICZsdDthbnN1ZWxzbXRoQGdtYWlsLmNvbSZndDs8
YnI+DQomZ3Q7IC0tLTxicj4NCiZndDsmbmJzcDsgYWVvbnNlbWkvYXMyMXgxeF9mdy5iaW4gfCBC
aW4gMjYxNDAwIC0mZ3Q7IDI5MDI3MiBieXRlczxicj4NCiZndDsmbmJzcDsgMSBmaWxlIGNoYW5n
ZWQsIDAgaW5zZXJ0aW9ucygrKSwgMCBkZWxldGlvbnMoLSk8YnI+DQo8YnI+DQotLTxicj4NCldp
dGggYmVzdCB3aXNoZXM8YnI+DQpEbWl0cnk8YnI+DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4N
Cg==

--_000_DM3PR19MB83582370043EC80A5BE42ECF8691ADM3PR19MB8358namp_--
