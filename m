Return-Path: <SRS0=DVQh=F7=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89FACDB482
	for <linux-firmware@archiver.kernel.org>; Tue, 17 Oct 2023 19:26:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A88FFC433C8; Tue, 17 Oct 2023 19:26:45 +0000 (UTC)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2075.outbound.protection.outlook.com [40.107.95.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8D47BC433C7;
	Tue, 17 Oct 2023 19:26:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8D47BC433C7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b+99MH9pH2CBxvyxwcHryNNUIjEkTLDgGt7iloaU6VSei6sMO4ZoQ7sKnQsCOKPeM0Mfq7dJKdTzIMXrGsbPO1+qCUVfgwK1vYCrgFNSIlK5hzUfXped9Docjas2qL5XeWcJ7RECXuKhDybGUKgHn7TOUtT0V1juQJDIfwwU1dtWaypbgpV8eG078m3tB12jdvPmy0xWw9Qv4hPWLEZH5J2XmCa7/ZzMOoIZMvcHZnmg8ti3ntwXTyUTQ9sTcsQ+zTgE2LCT4ZBZ5tuVtw0nfuwWEpFt89LWLeWOwImSa5pVnC/4lC/t+X0Fw8MLHz9GVTpCqFxFlp9tpzFWPphPSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oTyPeqHYLN9Jy7mj2osodec3VkdIlx2V4gnCVmDX9ZU=;
 b=M7+V3ZKqElHOek2pxKafUQdihWU4yJ/kR6Wi8lUo52gtAAbw0WFDFkp+EpXIPkVCNV+aLFd2rjEOi4Ey3DT1AHMvJTna0WEfk4r+hzeKYR5mtZBTQd5RV8Ue1zw4VMe8wcljtbbTFOSLMGf6uO1cVyB5Q39Kwk6J4/M5fimtl0jAcDPPZYGMI2YDo8HR6khrL0OliEFB6G9BUUu0cl+lLXRC3ZGCZwV+UwHPG/qGZTVylvkX6/byyNz2EwQm2jktrrrGBOT9AZKt9+IIV0QWMU+X8c0B+OosoCKPSIts6E2s4b9jrdKZHnWchZoGtKqscH/zpuRdA1dyC6aUwenBfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oTyPeqHYLN9Jy7mj2osodec3VkdIlx2V4gnCVmDX9ZU=;
 b=3ejYaQ4bnc5Za8FKbk4y4ZWbUprIEmjM04CNCGFFMV1G4m3Nnbvc1OUvdvT05k9QAXsyCWzetuSbztqjE1At2yNMwxlxXDdCUjN/wA9xlM0uqHtbQ0MtP8AJ5TYvNSTjeX82yoF1rS3JE242fMNJxXnYBBPx6dQDaZJlVLJscfQ=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH2PR12MB4889.namprd12.prod.outlook.com (2603:10b6:610:68::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Tue, 17 Oct
 2023 19:26:40 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3e65:d396:58fb:27d4]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3e65:d396:58fb:27d4%3]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 19:26:39 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, "jwboyer@kernel.org"
	<jwboyer@kernel.org>
CC: "Wang, Chao-kai (Stylon)" <Stylon.Wang@amd.com>, "Sharma, Deepak"
	<Deepak.Sharma@amd.com>
Subject: RE: [pull] amdgpu firmware amd-2023-10-17
Thread-Topic: [pull] amdgpu firmware amd-2023-10-17
Thread-Index: AQHaAS3ZxzJG8QLEw0C9spgqACCJbLBOXQqA
Date: Tue, 17 Oct 2023 19:26:39 +0000
Message-ID:
 <MN0PR12MB61010CF12A4F8700360886E0E2D6A@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <20231017191158.2247834-1-alexander.deucher@amd.com>
In-Reply-To: <20231017191158.2247834-1-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=5edcaac7-7b53-4b9f-a26e-e806b34de53a;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-10-17T19:25:34Z;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|CH2PR12MB4889:EE_
x-ms-office365-filtering-correlation-id: 65e052a2-ae61-4ce8-587a-08dbcf46fccb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 YrKt8DZfHJ79josAgfFmaZMsWYacBQVY+gvBnxOSq/rMp2VibapQhEAIZTWz6XoSJLys+i2iJ9abGS3zifjQrEMdUWTI1p/VdEgpJISUn8WVla7/6YrAXIEMDxgUvbKKC86lSTeV/8wNacXa2hv6KoO9ak4rfd62LQHMTWybFyaSlmGJOaJsApto0b9dWUr6l7QfbqY0fawkQi7+3HrT0grk1F3HKgEpuPlr+ZunYpiRMBeFHUl+0ZDO9YP70B4FbyEIMno242VbeB/UXDLI4xP3RphoCL1m8EyPLg1Yj2/gr1tMZJ5g8cW6oOnxGF8WKKoaygyMGSfx0W2n9kL8JRPefZuwCdtjBVFpS+aMRtqNGPi+h62oYlY8f1mNHUQ6xJdisBpWW320YsMcil9mZK1ABtx3mQbHfipht8a0UO49heMcUXqqSGwCpk7ROAQ7QswFbJgx+lY7nUIzvnbf4WK99E6/XaBCU+NzPotUdwlBXfLOjn6yCasdlmdplAhzHwFdbOchSueMXYsIdrja5eZUuPy5yqKIFaYe3Jt5q3nZp/RnmKBDbSdSSVbOMG0+EH1O/FR4rbFecxOCHDMF5Gm+6UeE3N7KFGtHbxrajKSGPGcfxHFASUzM72jJ7PzrEwelKIeNVXQQNa9GvgNISQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(346002)(39860400002)(376002)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(76116006)(30864003)(316002)(54906003)(66946007)(66476007)(110136005)(86362001)(66556008)(66446008)(2906002)(4001150100001)(5660300002)(55016003)(8936002)(8676002)(4326008)(450100002)(52536014)(64756008)(41300700001)(33656002)(38100700002)(478600001)(122000001)(53546011)(7696005)(6506007)(38070700005)(9686003)(71200400001)(966005)(26005)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?bAJSttjrDfdx/hKrt0tpGoZcBRVrMM65zbGr3lnHqN9XrIkEp4mciwGsQqVH?=
 =?us-ascii?Q?gbDVVK9HaBrY9xPVp2YgZmoHja8AvzKYmCr7Mz49l3oaIjG/0+qnzHYArIZ5?=
 =?us-ascii?Q?vbNi9Dh7zpyFY85ZW4hx65adPd2jBNTjO0TB3Xh45jI16DVlai1So3H37pTj?=
 =?us-ascii?Q?vJXtIjAvxv5mF8oMJ53Q8jiEHsWSI1m8KXozQarl1xhr4bXE/Fs8MkEdCow8?=
 =?us-ascii?Q?DGs9UVD2YbgfQVM+XpfJBBY/0TAD47sKRB+QOcNyvBLcWqHH7iX2SxskAHqX?=
 =?us-ascii?Q?gd0I7H9ekSqR+utLXtogBVZRIxeV2yJm1Sje0sRpWVzQKmupDMvVf8+ZKjOS?=
 =?us-ascii?Q?VnGTS92dlqlRSg0hxvggniMDdCBArdvdvWH0XFCadkONr/hnBGNMz8uSvY1g?=
 =?us-ascii?Q?IwjFkzfaLy4Hivu1DnRKNxri5csv1V0vGjShRhK4p73314YcoXiEBjo7cb06?=
 =?us-ascii?Q?CUvdYwOuVvqLVbzR211kmsVvQDaKhAdWTc3u+ntVz6Vs0Cy8VMST5yIuSrvC?=
 =?us-ascii?Q?t6Euy5MFeBg3rHFHMmq+3lEO2zdeIKH3eNYNGZaDvQxB15cCrnT4zAURBKkm?=
 =?us-ascii?Q?03YyDa031kLXWLusMnpLD44iL7UtV5JeoPGc15nqIsZTFpt0nUTrFBQSE25z?=
 =?us-ascii?Q?30gHQ5aPvMGc2dsRJIeWSE2gjSmiLKYsDQh7A7oRi3J4bvTuPsqNwze0Dnzy?=
 =?us-ascii?Q?9SyEiu1aiN7XMBIED7O7e8y8OgfNbuE8ja0xZO2P2t8xHpr+tGwg8jxpW+Kk?=
 =?us-ascii?Q?O2mTVgVtMKYUmftazYJh8LkcpzjMXJAfjwgBEFmCY7uL1F2xerH9g/mPPo2t?=
 =?us-ascii?Q?0W1Hsk62GqqcLnfNY2HGqfIDziAhCwN4uDKmHz7MzHBQMNOxqAOUN5ZGEmq7?=
 =?us-ascii?Q?NcDQOqeD7eku7LHTJOJEZaIbTAbKf493/UNIamTlEhRdkZ5CddaJ+PV13Tyt?=
 =?us-ascii?Q?xzxAa3hB54iS40YDhOApFV67l8s4giVq/tq47VYpahIZ2r/7i0UNy6iyyNPR?=
 =?us-ascii?Q?ThYNil1ELpBkPiGSJdg6o+HJ/XREEn2VnZVp6wb+upgNWh6ol4RQzoRgp1qh?=
 =?us-ascii?Q?cB52573Cag2IXe7WrgfRLK6SSYUSJVv6C6KC2isNkERLg5mxGbGt9uosPLP9?=
 =?us-ascii?Q?RlHRQDa9iUfLQSN1CD5zETJPGKbCBuA5o/bRlftE1quBJhqe1MZmVr3fnpLt?=
 =?us-ascii?Q?27e+1wmkg4SMKdhWxFzyjS/XLmwLVjFygF0GnQSYnzjhElG2QF3S7tJx5z1L?=
 =?us-ascii?Q?TSqxHOOb+ShxijI3umN01yUSaps3/t99FxH9U6suCWUdw2N++XuJs0JPhtoJ?=
 =?us-ascii?Q?MND0tbDsqBszYRSXCKS8D+873vje1DxkxdUku6oHs1CfVvuohKN1DAQzXJxM?=
 =?us-ascii?Q?zbJlmil2WICtFq156aJcXOG5MuHBBCqKBJtLJTO2KI/r4g5e6KHY+KfUvE7i?=
 =?us-ascii?Q?oQoYvIkQU8SrPqyR6MEPIydyglYKxqRim0TnA5RK2oRlz6dkZCwHhYuLcw4D?=
 =?us-ascii?Q?Re381rXtCwlDgJTFRBHzSmOkyygWeb2mhDYV/JCHWtu6Gglj9TjyiDpothtC?=
 =?us-ascii?Q?rw4x5Ildn8dTub1DYT4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65e052a2-ae61-4ce8-587a-08dbcf46fccb
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2023 19:26:39.8346
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i7/ggy7H8aZYWy7tXkkrFkNhIl3WQApp/GpgMJevYfFTzpab6uCWOVx+zaFEWT2T0zcpWfvTa9NOWFnnAkMgtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4889

[AMD Official Use Only - General]

> -----Original Message-----
> From: Deucher, Alexander <Alexander.Deucher@amd.com>
> Sent: Tuesday, October 17, 2023 14:12
> To: linux-firmware@kernel.org; jwboyer@kernel.org
> Cc: Limonciello, Mario <Mario.Limonciello@amd.com>; Wang, Chao-kai
> (Stylon) <Stylon.Wang@amd.com>; Sharma, Deepak
> <Deepak.Sharma@amd.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>
> Subject: [pull] amdgpu firmware amd-2023-10-17
>
> Hi,
>
> Updated amdgpu firmwares.  Please pull!
>

Merged: https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/=
32

Thanks!

> The following changes since commit
> 2bbca647e4aeed3813ba7776d309c4525e0ad841:
>
>   amdgpu: update DMCUB to 0.0.183.0 for various AMDGPU ASICs (2023-09-
> 08 22:30:18 +0800)
>
> are available in the Git repository at:
>
>   https://gitlab.freedesktop.org/drm/firmware.git tags/amd-2023-10-17
>
> for you to fetch changes up to
> a3bcbbf2e5d13b49197ecd39ae47715515bf38c2:
>
>   amdgpu: update SMU 13.0.0 firmware (2023-10-17 09:31:52 -0400)
>
> ----------------------------------------------------------------
> amd-2023-10-17:
>
> Update firmwares from 5.7 branch.
>
> ----------------------------------------------------------------
> Alex Deucher (44):
>       amdgpu: update aldebaran firmware from 5.7 branch
>       amdgpu: update GC 11.0.3 firmware from 5.7 branch
>       amdgpu: update PSP 13.0.10 firmware from 5.7 branch
>       amdgpu: update SMU 13.0.10 firmware from 5.7 branch
>       amdgpu: update raven2 firmware from 5.7 branch
>       amdgpu: update navi10 firmware from 5.7 branch
>       amdgpu: update yellow carp firmware from 5.7 branch
>       amdgpu: update GC 11.0.2 firmware from 5.7 branch
>       amdgpu: update PSP 13.0.7 firmware from 5.7 branch
>       amdgpu: update SDMA 6.0.2 firmware from 5.7 branch
>       amdgpu: update SMU 13.0.7 firmware from 5.7 branch
>       amdgpu: update VCN 4.0.4 firmware from 5.7 branch
>       amdgpu: update navi12 firmware from 5.7 branch
>       amdgpu: update renoir firmware from 5.7 branch
>       amdgpu: update navi14 firmware from 5.7 branch
>       amdgpu: update GC 11.0.1 firmware from 5.7 branch
>       amdgpu: update PSP 13.0.4 firmware from 5.7 branch
>       amdgpu: update SDMA 6.0.1 firmware from 5.7 branch
>       amdgpu: update GC 11.0.4 firmware from 5.7 branch
>       amdgpu: update PSP 13.0.11 firmware from 5.7 branch
>       amdgpu: update sienna cichlid firmware from 5.7 branch
>       amdgpu: update green sardine firmware from 5.7 branch
>       amdgpu: update vangogh firmware from 5.7 branch
>       amdgpu: update navy flounder firmware from 5.7 branch
>       amdgpu: update picasso firmware from 5.7 branch
>       amdgpu: update dimgrey cavefish firmware from 5.7 branch
>       amdgpu: update vega10 firmware from 5.7 branch
>       amdgpu: update vega12 firmware from 5.7 branch
>       amdgpu: update beige goby firmware from 5.7 branch
>       amdgpu: update vega20 firmware from 5.7 branch
>       amdgpu: update GC 11.0.0 firmware from 5.7 branch
>       amdgpu: update PSP 13.0.0 firmware from 5.7 branch
>       amdgpu: update SDMA 6.0.0 firmware from 5.7 branch
>       amdgpu: update SMU 13.0.0 firmware from 5.7 branch
>       amdgpu: update VCN 4.0.0 firmware from 5.7 branch
>       amdgpu: update GC 10.3.6 firmware from 5.7 branch
>       amdgpu: update PSP 13.0.5 firmware from 5.7 branch
>       amdgpu: update SDMA 5.2.6 firmware from 5.7 branch
>       amdgpu: update DCN 3.1.6 firmware from 5.7 branch
>       amdgpu: update GC 10.3.7 firmware from 5.7 branch
>       amdgpu: update PSP 13.0.8 firmware from 5.7 branch
>       amdgpu: update SDMA 5.2.7 firmware from 5.7 branch
>       amdgpu: update raven firmware from 5.7 branch
>       amdgpu: update SMU 13.0.0 firmware
>
>  amdgpu/aldebaran_mec.bin         | Bin 268576 -> 268560 bytes
>  amdgpu/aldebaran_mec2.bin        | Bin 268576 -> 268560 bytes
>  amdgpu/aldebaran_sjt_mec.bin     | Bin 268576 -> 268560 bytes
>  amdgpu/aldebaran_sjt_mec2.bin    | Bin 268576 -> 268560 bytes
>  amdgpu/aldebaran_sos.bin         | Bin 442080 -> 442080 bytes
>  amdgpu/beige_goby_ce.bin         | Bin 263296 -> 263296 bytes
>  amdgpu/beige_goby_dmcub.bin      | Bin 112116 -> 113908 bytes
>  amdgpu/beige_goby_me.bin         | Bin 263424 -> 263424 bytes
>  amdgpu/beige_goby_mec.bin        | Bin 268720 -> 268720 bytes
>  amdgpu/beige_goby_mec2.bin       | Bin 268720 -> 268720 bytes
>  amdgpu/beige_goby_pfp.bin        | Bin 263424 -> 263424 bytes
>  amdgpu/beige_goby_smc.bin        | Bin 244934 -> 244934 bytes
>  amdgpu/beige_goby_sos.bin        | Bin 205984 -> 205984 bytes
>  amdgpu/beige_goby_ta.bin         | Bin 218368 -> 226560 bytes
>  amdgpu/beige_goby_vcn.bin        | Bin 579568 -> 579568 bytes
>  amdgpu/dcn_3_1_6_dmcub.bin       | Bin 215568 -> 215568 bytes
>  amdgpu/dimgrey_cavefish_ce.bin   | Bin 263296 -> 263296 bytes
>  amdgpu/dimgrey_cavefish_me.bin   | Bin 263424 -> 263424 bytes
>  amdgpu/dimgrey_cavefish_mec.bin  | Bin 268720 -> 268720 bytes
>  amdgpu/dimgrey_cavefish_mec2.bin | Bin 268720 -> 268720 bytes
>  amdgpu/dimgrey_cavefish_pfp.bin  | Bin 263424 -> 263424 bytes
>  amdgpu/dimgrey_cavefish_smc.bin  | Bin 244902 -> 244902 bytes
>  amdgpu/dimgrey_cavefish_sos.bin  | Bin 210416 -> 210416 bytes
>  amdgpu/dimgrey_cavefish_ta.bin   | Bin 218368 -> 226560 bytes
>  amdgpu/dimgrey_cavefish_vcn.bin  | Bin 579568 -> 579568 bytes
>  amdgpu/gc_10_3_6_rlc.bin         | Bin 177088 -> 177088 bytes
>  amdgpu/gc_10_3_7_rlc.bin         | Bin 177088 -> 177088 bytes
>  amdgpu/gc_11_0_0_imu.bin         | Bin 132352 -> 132352 bytes
>  amdgpu/gc_11_0_0_me.bin          | Bin 189520 -> 197216 bytes
>  amdgpu/gc_11_0_0_mec.bin         | Bin 407072 -> 407072 bytes
>  amdgpu/gc_11_0_0_mes_2.bin       | Bin 289280 -> 239136 bytes
>  amdgpu/gc_11_0_0_pfp.bin         | Bin 207984 -> 211104 bytes
>  amdgpu/gc_11_0_0_rlc.bin         | Bin 184992 -> 184992 bytes
>  amdgpu/gc_11_0_1_me.bin          | Bin 263424 -> 263424 bytes
>  amdgpu/gc_11_0_1_mec.bin         | Bin 268704 -> 268704 bytes
>  amdgpu/gc_11_0_1_mes_2.bin       | Bin 289152 -> 235072 bytes
>  amdgpu/gc_11_0_1_pfp.bin         | Bin 263424 -> 263424 bytes
>  amdgpu/gc_11_0_1_rlc.bin         | Bin 160592 -> 160592 bytes
>  amdgpu/gc_11_0_2_me.bin          | Bin 189552 -> 197216 bytes
>  amdgpu/gc_11_0_2_mec.bin         | Bin 407072 -> 407072 bytes
>  amdgpu/gc_11_0_2_mes_2.bin       | Bin 289408 -> 239136 bytes
>  amdgpu/gc_11_0_2_pfp.bin         | Bin 207984 -> 211088 bytes
>  amdgpu/gc_11_0_3_imu.bin         | Bin 132352 -> 132352 bytes
>  amdgpu/gc_11_0_3_me.bin          | Bin 197232 -> 197232 bytes
>  amdgpu/gc_11_0_3_mec.bin         | Bin 407072 -> 407072 bytes
>  amdgpu/gc_11_0_3_mes1.bin        | Bin 216768 -> 211792 bytes
>  amdgpu/gc_11_0_3_mes_2.bin       | Bin 235616 -> 239200 bytes
>  amdgpu/gc_11_0_3_pfp.bin         | Bin 211088 -> 211088 bytes
>  amdgpu/gc_11_0_3_rlc.bin         | Bin 178832 -> 178832 bytes
>  amdgpu/gc_11_0_4_me.bin          | Bin 263424 -> 263424 bytes
>  amdgpu/gc_11_0_4_mec.bin         | Bin 268704 -> 268704 bytes
>  amdgpu/gc_11_0_4_mes_2.bin       | Bin 289152 -> 234048 bytes
>  amdgpu/gc_11_0_4_pfp.bin         | Bin 263424 -> 263424 bytes
>  amdgpu/gc_11_0_4_rlc.bin         | Bin 159472 -> 158752 bytes
>  amdgpu/green_sardine_asd.bin     | Bin 172544 -> 180736 bytes
>  amdgpu/green_sardine_ce.bin      | Bin 36608 -> 36608 bytes
>  amdgpu/green_sardine_dmcub.bin   | Bin 121608 -> 121608 bytes
>  amdgpu/green_sardine_me.bin      | Bin 69376 -> 69376 bytes
>  amdgpu/green_sardine_mec.bin     | Bin 268048 -> 268048 bytes
>  amdgpu/green_sardine_mec2.bin    | Bin 268048 -> 268048 bytes
>  amdgpu/green_sardine_pfp.bin     | Bin 85760 -> 85760 bytes
>  amdgpu/green_sardine_ta.bin      | Bin 33536 -> 33536 bytes
>  amdgpu/green_sardine_vcn.bin     | Bin 402880 -> 403136 bytes
>  amdgpu/navi10_asd.bin            | Bin 172544 -> 180736 bytes
>  amdgpu/navi10_ta.bin             | Bin 33536 -> 33536 bytes
>  amdgpu/navi10_vcn.bin            | Bin 402112 -> 403136 bytes
>  amdgpu/navi12_asd.bin            | Bin 172544 -> 184832 bytes
>  amdgpu/navi12_ce.bin             | Bin 263296 -> 263296 bytes
>  amdgpu/navi12_me.bin             | Bin 263424 -> 263424 bytes
>  amdgpu/navi12_mec.bin            | Bin 268592 -> 268592 bytes
>  amdgpu/navi12_mec2.bin           | Bin 268592 -> 268592 bytes
>  amdgpu/navi12_pfp.bin            | Bin 263424 -> 263424 bytes
>  amdgpu/navi12_ta.bin             | Bin 33536 -> 33536 bytes
>  amdgpu/navi12_vcn.bin            | Bin 402112 -> 403136 bytes
>  amdgpu/navi14_asd.bin            | Bin 172544 -> 180736 bytes
>  amdgpu/navi14_ta.bin             | Bin 33536 -> 33536 bytes
>  amdgpu/navi14_vcn.bin            | Bin 402112 -> 403136 bytes
>  amdgpu/navy_flounder_ce.bin      | Bin 263296 -> 263296 bytes
>  amdgpu/navy_flounder_me.bin      | Bin 263424 -> 263424 bytes
>  amdgpu/navy_flounder_mec.bin     | Bin 268720 -> 268720 bytes
>  amdgpu/navy_flounder_mec2.bin    | Bin 268720 -> 268720 bytes
>  amdgpu/navy_flounder_pfp.bin     | Bin 263424 -> 263424 bytes
>  amdgpu/navy_flounder_smc.bin     | Bin 244902 -> 244902 bytes
>  amdgpu/navy_flounder_ta.bin      | Bin 218368 -> 226560 bytes
>  amdgpu/navy_flounder_vcn.bin     | Bin 579568 -> 579568 bytes
>  amdgpu/picasso_asd.bin           | Bin 172544 -> 180736 bytes
>  amdgpu/picasso_ce.bin            | Bin 9344 -> 9344 bytes
>  amdgpu/picasso_me.bin            | Bin 17536 -> 17536 bytes
>  amdgpu/picasso_mec.bin           | Bin 268064 -> 268064 bytes
>  amdgpu/picasso_mec2.bin          | Bin 268064 -> 268064 bytes
>  amdgpu/picasso_pfp.bin           | Bin 21632 -> 21632 bytes
>  amdgpu/picasso_ta.bin            | Bin 41984 -> 41984 bytes
>  amdgpu/psp_13_0_0_sos.bin        | Bin 268304 -> 268304 bytes
>  amdgpu/psp_13_0_0_ta.bin         | Bin 242944 -> 242944 bytes
>  amdgpu/psp_13_0_10_sos.bin       | Bin 355808 -> 355808 bytes
>  amdgpu/psp_13_0_11_ta.bin        | Bin 271808 -> 218560 bytes
>  amdgpu/psp_13_0_4_ta.bin         | Bin 271808 -> 218560 bytes
>  amdgpu/psp_13_0_5_asd.bin        | Bin 172544 -> 184832 bytes
>  amdgpu/psp_13_0_5_ta.bin         | Bin 205824 -> 218112 bytes
>  amdgpu/psp_13_0_7_sos.bin        | Bin 248496 -> 248496 bytes
>  amdgpu/psp_13_0_7_ta.bin         | Bin 218112 -> 218112 bytes
>  amdgpu/psp_13_0_8_ta.bin         | Bin 205824 -> 218112 bytes
>  amdgpu/raven2_asd.bin            | Bin 168448 -> 180736 bytes
>  amdgpu/raven2_ce.bin             | Bin 9344 -> 9344 bytes
>  amdgpu/raven2_me.bin             | Bin 17536 -> 17536 bytes
>  amdgpu/raven2_mec.bin            | Bin 268048 -> 268048 bytes
>  amdgpu/raven2_mec2.bin           | Bin 268048 -> 268048 bytes
>  amdgpu/raven2_pfp.bin            | Bin 21632 -> 21632 bytes
>  amdgpu/raven2_ta.bin             | Bin 33536 -> 33536 bytes
>  amdgpu/raven_asd.bin             | Bin 168448 -> 180736 bytes
>  amdgpu/raven_ce.bin              | Bin 9344 -> 9344 bytes
>  amdgpu/raven_me.bin              | Bin 17536 -> 17536 bytes
>  amdgpu/raven_mec.bin             | Bin 268048 -> 268064 bytes
>  amdgpu/raven_mec2.bin            | Bin 268048 -> 268064 bytes
>  amdgpu/raven_pfp.bin             | Bin 21632 -> 21632 bytes
>  amdgpu/raven_ta.bin              | Bin 33536 -> 33536 bytes
>  amdgpu/renoir_asd.bin            | Bin 172544 -> 180736 bytes
>  amdgpu/renoir_ce.bin             | Bin 9344 -> 9344 bytes
>  amdgpu/renoir_dmcub.bin          | Bin 121608 -> 121608 bytes
>  amdgpu/renoir_me.bin             | Bin 17536 -> 17536 bytes
>  amdgpu/renoir_mec.bin            | Bin 268064 -> 268048 bytes
>  amdgpu/renoir_mec2.bin           | Bin 268064 -> 268048 bytes
>  amdgpu/renoir_pfp.bin            | Bin 21632 -> 21632 bytes
>  amdgpu/renoir_ta.bin             | Bin 41984 -> 41984 bytes
>  amdgpu/renoir_vcn.bin            | Bin 402880 -> 403136 bytes
>  amdgpu/sdma_5_2_6.bin            | Bin 34048 -> 34048 bytes
>  amdgpu/sdma_5_2_7.bin            | Bin 34048 -> 34048 bytes
>  amdgpu/sdma_6_0_0.bin            | Bin 34560 -> 34560 bytes
>  amdgpu/sdma_6_0_1.bin            | Bin 34560 -> 34560 bytes
>  amdgpu/sdma_6_0_2.bin            | Bin 34560 -> 34560 bytes
>  amdgpu/sienna_cichlid_ce.bin     | Bin 263296 -> 263296 bytes
>  amdgpu/sienna_cichlid_me.bin     | Bin 263424 -> 263424 bytes
>  amdgpu/sienna_cichlid_mec.bin    | Bin 268720 -> 268720 bytes
>  amdgpu/sienna_cichlid_mec2.bin   | Bin 268720 -> 268720 bytes
>  amdgpu/sienna_cichlid_pfp.bin    | Bin 263424 -> 263424 bytes
>  amdgpu/sienna_cichlid_rlc.bin    | Bin 132960 -> 132960 bytes
>  amdgpu/sienna_cichlid_sos.bin    | Bin 227440 -> 227456 bytes
>  amdgpu/sienna_cichlid_ta.bin     | Bin 345856 -> 354048 bytes
>  amdgpu/sienna_cichlid_vcn.bin    | Bin 579568 -> 579568 bytes
>  amdgpu/smu_13_0_0.bin            | Bin 292452 -> 292452 bytes
>  amdgpu/smu_13_0_10.bin           | Bin 271520 -> 271520 bytes
>  amdgpu/smu_13_0_7.bin            | Bin 287080 -> 287080 bytes
>  amdgpu/vangogh_asd.bin           | Bin 172544 -> 184832 bytes
>  amdgpu/vangogh_ce.bin            | Bin 263296 -> 263296 bytes
>  amdgpu/vangogh_me.bin            | Bin 263424 -> 263424 bytes
>  amdgpu/vangogh_mec.bin           | Bin 268720 -> 268720 bytes
>  amdgpu/vangogh_mec2.bin          | Bin 268720 -> 268720 bytes
>  amdgpu/vangogh_pfp.bin           | Bin 263424 -> 263424 bytes
>  amdgpu/vcn_4_0_0.bin             | Bin 384336 -> 385232 bytes
>  amdgpu/vcn_4_0_4.bin             | Bin 379056 -> 385232 bytes
>  amdgpu/vega10_asd.bin            | Bin 172544 -> 180736 bytes
>  amdgpu/vega10_ce.bin             | Bin 9344 -> 9344 bytes
>  amdgpu/vega10_me.bin             | Bin 17536 -> 17536 bytes
>  amdgpu/vega10_mec.bin            | Bin 268064 -> 268048 bytes
>  amdgpu/vega10_mec2.bin           | Bin 268064 -> 268048 bytes
>  amdgpu/vega10_pfp.bin            | Bin 21632 -> 21632 bytes
>  amdgpu/vega12_asd.bin            | Bin 172544 -> 180736 bytes
>  amdgpu/vega12_ce.bin             | Bin 9344 -> 9344 bytes
>  amdgpu/vega12_me.bin             | Bin 17536 -> 17536 bytes
>  amdgpu/vega12_mec.bin            | Bin 268064 -> 268048 bytes
>  amdgpu/vega12_mec2.bin           | Bin 268064 -> 268048 bytes
>  amdgpu/vega12_pfp.bin            | Bin 21632 -> 21632 bytes
>  amdgpu/vega20_asd.bin            | Bin 172544 -> 180736 bytes
>  amdgpu/vega20_ce.bin             | Bin 9344 -> 9344 bytes
>  amdgpu/vega20_me.bin             | Bin 17536 -> 17536 bytes
>  amdgpu/vega20_mec.bin            | Bin 268064 -> 268048 bytes
>  amdgpu/vega20_mec2.bin           | Bin 268064 -> 268048 bytes
>  amdgpu/vega20_pfp.bin            | Bin 21632 -> 21632 bytes
>  amdgpu/yellow_carp_ce.bin        | Bin 263296 -> 263296 bytes
>  amdgpu/yellow_carp_me.bin        | Bin 263424 -> 263424 bytes
>  amdgpu/yellow_carp_mec.bin       | Bin 268720 -> 268720 bytes
>  amdgpu/yellow_carp_mec2.bin      | Bin 268720 -> 268720 bytes
>  amdgpu/yellow_carp_pfp.bin       | Bin 263424 -> 263424 bytes
>  amdgpu/yellow_carp_sdma.bin      | Bin 34048 -> 34048 bytes
>  amdgpu/yellow_carp_ta.bin        | Bin 205824 -> 218112 bytes
>  175 files changed, 0 insertions(+), 0 deletions(-)
