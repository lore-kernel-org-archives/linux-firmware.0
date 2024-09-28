Return-Path: <SRS0=R0/h=Q2=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95FC7CF6493
	for <linux-firmware@archiver.kernel.org>; Sat, 28 Sep 2024 18:55:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5EEE2C4CEC5; Sat, 28 Sep 2024 18:55:54 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2045.outbound.protection.outlook.com [40.107.93.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2EEF8C4CEC3
	for <linux-firmware@kernel.org>; Sat, 28 Sep 2024 18:55:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2EEF8C4CEC3
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lU9Weu44HerRrOKf2Mt2NiSzMRC9mYEECR1ghEhMc4Dx++Jj5bwYZ/PhMvKiIo6c9+nPxhKltUq1pWOluVbFRI6xpJ7PDbyz4ASrCbG6G3S1jU8pnCDucwl/h1o56XF4lgC/MBzj/hlLe7XkA5AZ8jiwvRdPEMMwtTeUwvQUOhtEFxGzoJD/gOR29dyIbp7OObTvXfHg8E7K9OJDP8TqyR1d+8dBr+/CKbiFpr5C9KCdKAYWhJFVzaCNbksKQF3Za5XalH/24p/MUGOgJTwIZVFrUQcyQb2+5zXhQsjJ7Ly0VEG+GqMZes/nYbto72uLfyyeDpYLNK0S4ihEblovag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JiwcKEIs8bfY3oA6zBkk48B3joRz3SajNPJpEhVhTcI=;
 b=RfkzzpGuIxAlrXGBXs9vzDvlSzcmfimlMHxS7tmppiiVlC+RhNJzSf+FKsa7YUa4A89ODir+SE9J9hSIUQkWnlJzu9CpNG+aLSOpdkitEy3fHeOEaHFuyGbxEcLyBrOVlhgxbzZKGzH81CpP4DIswM8dcpuZAm4jICu9QvCsgIYLrmmgtAY/dLvEsY1TBRb3fS3M0BoJIpFPjxj0NMEzWcLfsjcb+WBmUXRuZs2ik3X67vrJJ46xleE4GGtNxE8cnqt/n7SKsOq47m0ZgXuCEMaVyDeJQfIoJ8M1WhXwAU5mlDnTyzRSBMj/0YMGk5HNqq00eBErFdmvTaVzZyq0+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JiwcKEIs8bfY3oA6zBkk48B3joRz3SajNPJpEhVhTcI=;
 b=Ywgz3moav+T52C65znYzqePr73X28nfKsU3UUeO8A4h05FfUuxlNMoRsV+VC9uh/OQw5ATMjiB+5lsz98+bWtjTl0bJ9XqbwWfc6U6Q3AiIXTi2SIAI+fiOUMAbETwmPkAn9rxSwlGKmVf366x9/6opbDxXCsqC7zoiM2O/G2Eo=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH8PR12MB7278.namprd12.prod.outlook.com (2603:10b6:510:222::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22; Sat, 28 Sep
 2024 18:55:47 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.7982.022; Sat, 28 Sep 2024
 18:55:46 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: Re: [pull] amdgpu firmware updates
Thread-Topic: [pull] amdgpu firmware updates
Thread-Index: AQHbESOMBENS3rvU0UGUSEuvsqK2ALJtjbGq
Date: Sat, 28 Sep 2024 18:55:46 +0000
Message-ID:
 <MN0PR12MB61019C6004EB58D816705465E2742@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <20240927212324.3002636-1-alexander.deucher@amd.com>
In-Reply-To: <20240927212324.3002636-1-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-09-28T18:55:28.2931959Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-reactions: allow
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|PH8PR12MB7278:EE_
x-ms-office365-filtering-correlation-id: 838ba3de-33f8-4e54-0cff-08dcdfef296b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?j/fAqdXQXVmpnykqnN+ETUn+ySEEM9cB3MQeRl6+WP+iRhkdwt+knFBs4ouw?=
 =?us-ascii?Q?ZWy+i4457pk288r5y2xM8pqCHBWTsB9qPKyU9jDGbZ1N/34eTKg+W18isiOa?=
 =?us-ascii?Q?iTQKufDjIKHh+btSBbQLPsZYoltSNDM0JSy21JMEiK/TRysXNiCA06A9mgsZ?=
 =?us-ascii?Q?b5nXv2yPZOmHbkXT1O3kGpm6CIusmXr79oaO15ltzwS1RxOEYHznuwVR1ihV?=
 =?us-ascii?Q?/8dX/jfOng5YM79IIUnkswDD670YJQ+Vrebe1DdarAr7fKQMZUVbGpRPT8Rp?=
 =?us-ascii?Q?xsXWn9v8eWBw2Vnn4dtuC2XMZhusN/8FwfL0Gr9uMjGEU/BNnMSUFZT430iZ?=
 =?us-ascii?Q?3ECnNRlWEbc8sw/MPEnRdcXtlkb35jz99stynsYBKGGgUevsVXWuFqOp1PHv?=
 =?us-ascii?Q?O2exuZD4hOzoB/oIhJL5ZX1K2QuLWFNzbZtS5xek8bCHCAYWeGx59p63njlY?=
 =?us-ascii?Q?hX+9XaiGlsJSwx9k2K7ztlBKBBKlJBXuAm2mlGV2vGQRMEnH5GS2HS5+V6xN?=
 =?us-ascii?Q?ZOAcSEkLMu22oHwT7KXWjydh/BcRmEhPaa/JIuw6XDwPVdiu4k5bv0N4u8qZ?=
 =?us-ascii?Q?FiVqKYDRz2JpJDEuKR4YiP3VW6j8AzXUL01Dcww7ByO97rVfHQF1FPyTJAv4?=
 =?us-ascii?Q?LDi5n2o5Rhv17LEDpQlOG09tsk2m8gRL3gjOWJpIyxiIqTfcp9gxR2c7tmhO?=
 =?us-ascii?Q?EufQunyFGFmcMrMhscUAi7EpogwtQ4Az3U7CE0QOgfrRVWWjW2ZPVXOQ/8WI?=
 =?us-ascii?Q?rjWWhkRIHUnEVf0g/g9we4taW0cs2w/krTL2I+09xQQ5X4eTlMelYr0bt7/e?=
 =?us-ascii?Q?46wPPKK1NmJUI23CRB6tzMM8dO1NPx3id79s9fI0jFSuuLdysuGkBV0ZLCWC?=
 =?us-ascii?Q?jOxG5QxmL/UTgcLEgo1LerJP3ssU6P5aHzTJobb67NQoXc9BA2xG6AbhEsW6?=
 =?us-ascii?Q?zcDvl5FVyg4Ix//LwXOGj4gNvUzwkbfRTbKzhWcluWJTXZ9lLgiZ6W7ye/f+?=
 =?us-ascii?Q?AkkhconAv7rYGPGSyzDK24DeTEASlFOxij7CxE5eQR+9j8g/lpADDUC5RbyC?=
 =?us-ascii?Q?zki1SbDdLr5hN95l8RAFUck1WAf1URR2c4ZhbuYgudW3aWHOKBDdJdsRyD/p?=
 =?us-ascii?Q?jeNoSul3WIlNRKR8eLNrwuk6a4T9HMNfLMX2Wdye2VDXE0VyCGJSjRcni6Re?=
 =?us-ascii?Q?wuDvrYfDSN50TFdJ/tBCknNyKFYwJewy9lBo3cIFN/wioLSUARqPSQ3Hla+x?=
 =?us-ascii?Q?ghCno7JKhD9ANSnOx3KZCiqEeOPo+Zsf8BgOyGOB4emJEpo1XqGya7xBzYic?=
 =?us-ascii?Q?VLRhtTbIhRjri7jBEy4zgp2ez7rRRwMO7kFCdr6Oa/Om7A=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?5LozkSuY87kDcjzhvZoRt5ftA+GwxaJwBuy2AbfZQQZFnsW5UjK4m//pSjND?=
 =?us-ascii?Q?DUFJHHHpZJ7pHph6B278ge7C/a+t/FlOzumnev/RZBlzka1QIiRSmE8dqoJH?=
 =?us-ascii?Q?MbNAg9wVbVybFc8cXi2Upluo0f9uYAkrkdemHRhTcgqgBOsKanPo2nxEEj7T?=
 =?us-ascii?Q?VA94/o7ZEWvady41OgHO0QgAAqZDfCbt3it+9cccA1AlUb2JVynNPBr3FDHI?=
 =?us-ascii?Q?oqEG20nJwo7LJZXydXPVfFslrU/PnzD78eTkSO1vuMQCTFUM1crav/ri+N/o?=
 =?us-ascii?Q?DNufqM0CNBEiw+D5KCjpbA/hF5N24N6dnWf4PK9gyfFM/XqZW6UDgc4Lrq1A?=
 =?us-ascii?Q?u5sqDNKGf55R/rLkXpktamTC9RPJ49fVBhfSh0tBVqqX+AL44ndMIC200ZQC?=
 =?us-ascii?Q?Kdcfr27+tMHcAjX9mamd0pBnD+BEAQxzbAizw6CI6jT5Kxs9uNmKJaRxDnDK?=
 =?us-ascii?Q?MEmewMiovS5QhTl9mZAlmaJz6jaQ/NLqZcYobrpt052YoFeJWmy6w/rFhYKY?=
 =?us-ascii?Q?BtmzQxpEqNXCVFesijKAsRDXVxsuleRgOPSAcPGH/Y8VXTUYLrAImbD7I77A?=
 =?us-ascii?Q?lG0OFfQy8Omtnd/1/nVqoMTsiXOQ2XcPJgP631GvH6hGN4KCx7onGoEXVQE+?=
 =?us-ascii?Q?isqo4yUQTSnok2HLfxFdqWPfi4RToFIU6okcJjS5pmYLr0b/5MtePOg0+shE?=
 =?us-ascii?Q?/8c8l8wtnTmO53HO18obcO2FFaPYpWvkUInrEiWW5CfCgQxZi73V2XBUvYRe?=
 =?us-ascii?Q?ddv/oOJ/WKtxFzlbELKNyKp69MdFJDSGM2b7zV9uZ4oBcrBSuFwNkhUSTlY3?=
 =?us-ascii?Q?IWpn4LpofYV29/Z8QOQCCx2FceoSnROdBvRJ1qjg+ASJ/+AeaYlF0xHti5Rw?=
 =?us-ascii?Q?PCjOMyOmJfwrDwl+e29JE4B1KUR4AujzZxhyB64W3fSB5uSO2IoyLdx0hRSi?=
 =?us-ascii?Q?ot/rKCEJ95xdqWTzMZYtpTdt6cO03JGyUk4cs820Ymz81BFV3f8pX1YK1NOs?=
 =?us-ascii?Q?bLs+RBACzQtJ8WqIy9Rh64wLqMGMGn3nq2yaQInCIDu/Y5Rr3nwnqBPdItCy?=
 =?us-ascii?Q?MYpHBijUAUdXzomK017rsUMpb0JTRTcjxlqRwQWSQGX5r7SbF7aGF4SNy3nz?=
 =?us-ascii?Q?b0Id/KYLNcry0wMB/Qa1v7u/gR4+VY13erv09asG8L2w5AfPfu3tSPNVQ2ed?=
 =?us-ascii?Q?C9Wm54D3vUmuNjdSmJiVVNHe/neLboKesI/+P2VtoBiIDLST3nkFKzLMani7?=
 =?us-ascii?Q?upyxnB1vc9pWsp8M4PCZq6n2A0vDnL0NmjCOM0okeq23aywBJvVZry739T+O?=
 =?us-ascii?Q?zL85kH/fWfsk5yl2KG8B4Ac2qkrM0brbUJoQcHK2bgT2Y5f+wEROI+88fCPn?=
 =?us-ascii?Q?6Hhf8K/0lkEeB6cTmJomtTON9X/4ygUGQ9wDrbDSCwTrkUpUKDnyndrynFjL?=
 =?us-ascii?Q?vBbEnTIuz2Tg4wj6suCE8R+8thi5d5LagNDmkNKXggwTcvzyzFo2VHHl1s3f?=
 =?us-ascii?Q?oPqavUp80Pj/++r6OZ3IzuqOUwKNHZHdxqn5VmTVVE0X8Pe8VP2jYvlc13/L?=
 =?us-ascii?Q?bfwhEWIIDMdKTXJyFDOpFbg+1zwFND9L2nw/B+Vi?=
Content-Type: multipart/alternative;
	boundary="_000_MN0PR12MB61019C6004EB58D816705465E2742MN0PR12MB6101namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 838ba3de-33f8-4e54-0cff-08dcdfef296b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2024 18:55:46.4758
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8VAJpeuheXB1MRChBT3iMkUPrvFLKyIbDHYBLlaInQpqsGseTkK0DM0X4hKgug4EgVGQCSjqudTRzRoIKwxd4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7278

--_000_MN0PR12MB61019C6004EB58D816705465E2742MN0PR12MB6101namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - AMD Internal Distribution Only]

Merged, thanks!
________________________________
From: Deucher, Alexander <Alexander.Deucher@amd.com>
Sent: Friday, September 27, 2024 4:23:24 PM
To: linux-firmware@kernel.org <linux-firmware@kernel.org>; Limonciello, Mar=
io <Mario.Limonciello@amd.com>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>
Subject: [pull] amdgpu firmware updates

Hi,

Updated AMD GPU firmwares.

The following changes since commit bcbdd1670bc34d8044e1c1d4b88a5df30f901ec1=
:

  amdgpu: update DMCUB to v0.0.233.0 DCN351 (2024-09-13 20:26:57 +0000)

are available in the Git repository at:

  https://gitlab.com/kernel-firmware/drm-firmware.git tags/amd-staging-2024=
-09-27

for you to fetch changes up to 9a827f2b46514106238c95d47b1299837e552907:

  amdgpu: update raven firmware (2024-09-27 17:15:07 -0400)

----------------------------------------------------------------
amd-staging-2024-09-27:

Update GPU firmwares.

Based on internal git commit 97ae5dc916b1b174cc87c1f1502a19d2c044e6e6

----------------------------------------------------------------
Alex Deucher (43):
      amdgpu: update aldebaran firmware
      amdgpu: update navi10 firmware
      amdgpu: update GC 11.0.2 firmware
      amdgpu: update PSP 13.0.7 firmware
      amdgpu: update VCN 4.0.4 firmware
      amdgpu: update yellow carp firmware
      amdgpu: update GC 9.4.3 firmware
      amdgpu: update PSP 13.0.6 firmware
      amdgpu: update SDMA 4.4.2 firmware
      amdgpu: update SMU 13.0.6 firmware
      amdgpu: update navi12 firmware
      amdgpu: update renoir firmware
      amdgpu: update navi14 firmware
      amdgpu: update GC 11.5.0 firmware
      amdgpu: update PSP 14.0.0 firmware
      amdgpu: update VCN 4.0.5 firmware
      amdgpu: update GC 11.5.1 firmware
      amdgpu: update PSP 14.0.1 firmware
      amdgpu: update VCN 4.0.6 firmware
      amdgpu: update sienna cichlid firmware
      amdgpu: update GC 11.0.1 firmware
      amdgpu: update PSP 13.0.4 firmware
      amdgpu: update VCN 4.0.2 firmware
      amdgpu: update green sardine firmware
      amdgpu: update navy flounder firmware
      amdgpu: update dimgrey cavefish firmware
      amdgpu: update vangogh firmware
      amdgpu: update beige goby firmware
      amdgpu: update picasso firmware
      amdgpu: update GC 11.0.0 firmware
      amdgpu: update PSP 13.0.0 firmware
      amdgpu: update VCN 4.0.0 firmware
      amdgpu: update vega10 firmware
      amdgpu: update GC 11.5.2 firmware
      amdgpu: update PSP 14.0.4 firmware
      amdgpu: update vega12 firmware
      amdgpu: update PSP 13.0.8 firmware
      amdgpu: update PSP 13.0.5 firmware
      amdgpu: update VCN 3.1.2 firmware
      amdgpu: update GC 11.0.3 firmware
      amdgpu: update PSP 13.0.10 firmware
      amdgpu: update SMU 13.0.10 firmware
      amdgpu: update raven firmware

 amdgpu/aldebaran_mec.bin         | Bin 268576 -> 268736 bytes
 amdgpu/aldebaran_mec2.bin        | Bin 268576 -> 268736 bytes
 amdgpu/aldebaran_sdma.bin        | Bin 34304 -> 34304 bytes
 amdgpu/aldebaran_sjt_mec.bin     | Bin 268576 -> 268736 bytes
 amdgpu/aldebaran_sjt_mec2.bin    | Bin 268576 -> 268736 bytes
 amdgpu/aldebaran_smc.bin         | Bin 242688 -> 242688 bytes
 amdgpu/aldebaran_ta.bin          | Bin 140288 -> 140288 bytes
 amdgpu/beige_goby_ce.bin         | Bin 263296 -> 263296 bytes
 amdgpu/beige_goby_me.bin         | Bin 263424 -> 263424 bytes
 amdgpu/beige_goby_mec.bin        | Bin 268720 -> 268160 bytes
 amdgpu/beige_goby_mec2.bin       | Bin 268720 -> 268160 bytes
 amdgpu/beige_goby_pfp.bin        | Bin 263424 -> 263424 bytes
 amdgpu/beige_goby_ta.bin         | Bin 238848 -> 238848 bytes
 amdgpu/beige_goby_vcn.bin        | Bin 587120 -> 587376 bytes
 amdgpu/dimgrey_cavefish_ce.bin   | Bin 263296 -> 263296 bytes
 amdgpu/dimgrey_cavefish_me.bin   | Bin 263424 -> 263424 bytes
 amdgpu/dimgrey_cavefish_mec.bin  | Bin 268720 -> 268160 bytes
 amdgpu/dimgrey_cavefish_mec2.bin | Bin 268720 -> 268160 bytes
 amdgpu/dimgrey_cavefish_pfp.bin  | Bin 263424 -> 263424 bytes
 amdgpu/dimgrey_cavefish_sos.bin  | Bin 210416 -> 210416 bytes
 amdgpu/dimgrey_cavefish_ta.bin   | Bin 238848 -> 238848 bytes
 amdgpu/dimgrey_cavefish_vcn.bin  | Bin 587120 -> 587376 bytes
 amdgpu/gc_11_0_0_me.bin          | Bin 310784 -> 310784 bytes
 amdgpu/gc_11_0_0_mec.bin         | Bin 406528 -> 406528 bytes
 amdgpu/gc_11_0_0_mes1.bin        | Bin 217184 -> 217312 bytes
 amdgpu/gc_11_0_0_mes_2.bin       | Bin 253360 -> 255248 bytes
 amdgpu/gc_11_0_0_pfp.bin         | Bin 229328 -> 229456 bytes
 amdgpu/gc_11_0_1_me.bin          | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_0_1_mec.bin         | Bin 268704 -> 268704 bytes
 amdgpu/gc_11_0_1_mes_2.bin       | Bin 252800 -> 254784 bytes
 amdgpu/gc_11_0_1_pfp.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_0_2_me.bin          | Bin 310784 -> 310784 bytes
 amdgpu/gc_11_0_2_mec.bin         | Bin 406528 -> 406528 bytes
 amdgpu/gc_11_0_2_mes1.bin        | Bin 217536 -> 217664 bytes
 amdgpu/gc_11_0_2_mes_2.bin       | Bin 253264 -> 255056 bytes
 amdgpu/gc_11_0_2_pfp.bin         | Bin 229312 -> 229472 bytes
 amdgpu/gc_11_0_3_me.bin          | Bin 310800 -> 310800 bytes
 amdgpu/gc_11_0_3_mec.bin         | Bin 406528 -> 406528 bytes
 amdgpu/gc_11_0_3_mes1.bin        | Bin 217280 -> 217376 bytes
 amdgpu/gc_11_0_3_mes_2.bin       | Bin 253424 -> 255312 bytes
 amdgpu/gc_11_0_3_pfp.bin         | Bin 229312 -> 229472 bytes
 amdgpu/gc_11_5_0_mes_2.bin       | Bin 252992 -> 254624 bytes
 amdgpu/gc_11_5_1_imu.bin         | Bin 132352 -> 132352 bytes
 amdgpu/gc_11_5_1_me.bin          | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_1_mec.bin         | Bin 268704 -> 268704 bytes
 amdgpu/gc_11_5_1_mes_2.bin       | Bin 253280 -> 255168 bytes
 amdgpu/gc_11_5_1_pfp.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_1_rlc.bin         | Bin 161040 -> 161040 bytes
 amdgpu/gc_11_5_2_imu.bin         | Bin 132352 -> 132352 bytes
 amdgpu/gc_11_5_2_mes_2.bin       | Bin 253056 -> 254368 bytes
 amdgpu/gc_11_5_2_rlc.bin         | Bin 162096 -> 162096 bytes
 amdgpu/gc_9_4_3_mec.bin          | Bin 269200 -> 268736 bytes
 amdgpu/green_sardine_asd.bin     | Bin 193024 -> 193024 bytes
 amdgpu/green_sardine_ta.bin      | Bin 33536 -> 33536 bytes
 amdgpu/green_sardine_vcn.bin     | Bin 403392 -> 403904 bytes
 amdgpu/navi10_asd.bin            | Bin 193024 -> 193024 bytes
 amdgpu/navi10_sos.bin            | Bin 184512 -> 184512 bytes
 amdgpu/navi10_ta.bin             | Bin 33536 -> 33536 bytes
 amdgpu/navi10_vcn.bin            | Bin 403776 -> 403904 bytes
 amdgpu/navi12_asd.bin            | Bin 193024 -> 193024 bytes
 amdgpu/navi12_sos.bin            | Bin 204656 -> 204656 bytes
 amdgpu/navi12_ta.bin             | Bin 33536 -> 33536 bytes
 amdgpu/navi12_vcn.bin            | Bin 403776 -> 403904 bytes
 amdgpu/navi14_asd.bin            | Bin 193024 -> 193024 bytes
 amdgpu/navi14_sos.bin            | Bin 184176 -> 184176 bytes
 amdgpu/navi14_ta.bin             | Bin 33536 -> 33536 bytes
 amdgpu/navi14_vcn.bin            | Bin 403776 -> 403904 bytes
 amdgpu/navy_flounder_ce.bin      | Bin 263296 -> 263296 bytes
 amdgpu/navy_flounder_me.bin      | Bin 263424 -> 263424 bytes
 amdgpu/navy_flounder_mec.bin     | Bin 268720 -> 268160 bytes
 amdgpu/navy_flounder_mec2.bin    | Bin 268720 -> 268160 bytes
 amdgpu/navy_flounder_pfp.bin     | Bin 263424 -> 263424 bytes
 amdgpu/navy_flounder_sos.bin     | Bin 218608 -> 218608 bytes
 amdgpu/navy_flounder_ta.bin      | Bin 238848 -> 238848 bytes
 amdgpu/navy_flounder_vcn.bin     | Bin 587120 -> 587376 bytes
 amdgpu/picasso_asd.bin           | Bin 193024 -> 193024 bytes
 amdgpu/picasso_ta.bin            | Bin 41984 -> 41984 bytes
 amdgpu/psp_13_0_0_sos.bin        | Bin 268304 -> 268304 bytes
 amdgpu/psp_13_0_0_ta.bin         | Bin 251136 -> 251136 bytes
 amdgpu/psp_13_0_10_sos.bin       | Bin 360352 -> 360352 bytes
 amdgpu/psp_13_0_10_ta.bin        | Bin 247232 -> 247232 bytes
 amdgpu/psp_13_0_4_ta.bin         | Bin 234496 -> 234496 bytes
 amdgpu/psp_13_0_5_asd.bin        | Bin 193024 -> 193024 bytes
 amdgpu/psp_13_0_5_ta.bin         | Bin 226304 -> 226304 bytes
 amdgpu/psp_13_0_6_sos.bin        | Bin 385312 -> 774720 bytes
 amdgpu/psp_13_0_6_ta.bin         | Bin 67904 -> 67904 bytes
 amdgpu/psp_13_0_7_ta.bin         | Bin 226304 -> 226304 bytes
 amdgpu/psp_13_0_8_ta.bin         | Bin 226304 -> 226304 bytes
 amdgpu/psp_14_0_0_ta.bin         | Bin 234496 -> 234496 bytes
 amdgpu/psp_14_0_1_ta.bin         | Bin 234496 -> 234496 bytes
 amdgpu/psp_14_0_1_toc.bin        | Bin 2560 -> 2560 bytes
 amdgpu/psp_14_0_4_ta.bin         | Bin 234496 -> 234496 bytes
 amdgpu/psp_14_0_4_toc.bin        | Bin 2560 -> 2560 bytes
 amdgpu/raven_asd.bin             | Bin 193024 -> 193024 bytes
 amdgpu/raven_ta.bin              | Bin 33536 -> 33536 bytes
 amdgpu/renoir_asd.bin            | Bin 193024 -> 193024 bytes
 amdgpu/renoir_ta.bin             | Bin 41984 -> 41984 bytes
 amdgpu/renoir_vcn.bin            | Bin 403776 -> 403904 bytes
 amdgpu/sdma_4_4_2.bin            | Bin 34304 -> 34304 bytes
 amdgpu/sienna_cichlid_ce.bin     | Bin 263296 -> 263296 bytes
 amdgpu/sienna_cichlid_me.bin     | Bin 263424 -> 263424 bytes
 amdgpu/sienna_cichlid_mec.bin    | Bin 268720 -> 268160 bytes
 amdgpu/sienna_cichlid_mec2.bin   | Bin 268720 -> 268160 bytes
 amdgpu/sienna_cichlid_pfp.bin    | Bin 263424 -> 263424 bytes
 amdgpu/sienna_cichlid_sos.bin    | Bin 227456 -> 227456 bytes
 amdgpu/sienna_cichlid_ta.bin     | Bin 366336 -> 366336 bytes
 amdgpu/sienna_cichlid_vcn.bin    | Bin 587120 -> 587376 bytes
 amdgpu/smu_13_0_10.bin           | Bin 271520 -> 271520 bytes
 amdgpu/smu_13_0_6.bin            | Bin 2584 -> 3748 bytes
 amdgpu/vangogh_asd.bin           | Bin 193024 -> 193024 bytes
 amdgpu/vcn_3_1_2.bin             | Bin 579248 -> 579376 bytes
 amdgpu/vcn_4_0_0.bin             | Bin 391888 -> 392560 bytes
 amdgpu/vcn_4_0_2.bin             | Bin 391888 -> 392560 bytes
 amdgpu/vcn_4_0_4.bin             | Bin 391888 -> 392560 bytes
 amdgpu/vcn_4_0_5.bin             | Bin 391120 -> 391792 bytes
 amdgpu/vcn_4_0_6.bin             | Bin 391120 -> 391792 bytes
 amdgpu/vcn_4_0_6_1.bin           | Bin 391120 -> 391792 bytes
 amdgpu/vega10_asd.bin            | Bin 193024 -> 193024 bytes
 amdgpu/vega12_asd.bin            | Bin 193024 -> 193024 bytes
 amdgpu/yellow_carp_ta.bin        | Bin 226304 -> 226304 bytes
 amdgpu/yellow_carp_vcn.bin       | Bin 579248 -> 579504 bytes
 121 files changed, 0 insertions(+), 0 deletions(-)

--_000_MN0PR12MB61019C6004EB58D816705465E2742MN0PR12MB6101namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<p style=3D"font-family:Calibri;font-size:10pt;color:#0000FF;margin:5pt;fon=
t-style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
[AMD Official Use Only - AMD Internal Distribution Only]<br>
</p>
<br>
<div>
<div dir=3D"auto">Merged, thanks!</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Deucher, Alexander &l=
t;Alexander.Deucher@amd.com&gt;<br>
<b>Sent:</b> Friday, September 27, 2024 4:23:24 PM<br>
<b>To:</b> linux-firmware@kernel.org &lt;linux-firmware@kernel.org&gt;; Lim=
onciello, Mario &lt;Mario.Limonciello@amd.com&gt;<br>
<b>Cc:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;<br>
<b>Subject:</b> [pull] amdgpu firmware updates</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi,<br>
<br>
Updated AMD GPU firmwares.<br>
<br>
The following changes since commit bcbdd1670bc34d8044e1c1d4b88a5df30f901ec1=
:<br>
<br>
&nbsp; amdgpu: update DMCUB to v0.0.233.0 DCN351 (2024-09-13 20:26:57 +0000=
)<br>
<br>
are available in the Git repository at:<br>
<br>
&nbsp; <a href=3D"https://gitlab.com/kernel-firmware/drm-firmware.git">http=
s://gitlab.com/kernel-firmware/drm-firmware.git</a> tags/amd-staging-2024-0=
9-27<br>
<br>
for you to fetch changes up to 9a827f2b46514106238c95d47b1299837e552907:<br=
>
<br>
&nbsp; amdgpu: update raven firmware (2024-09-27 17:15:07 -0400)<br>
<br>
----------------------------------------------------------------<br>
amd-staging-2024-09-27:<br>
<br>
Update GPU firmwares.<br>
<br>
Based on internal git commit 97ae5dc916b1b174cc87c1f1502a19d2c044e6e6<br>
<br>
----------------------------------------------------------------<br>
Alex Deucher (43):<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu: update aldebaran firmware<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu: update navi10 firmware<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu: update GC 11.0.2 firmware<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu: update PSP 13.0.7 firmware<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu: update VCN 4.0.4 firmware<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu: update yellow carp firmware<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu: update GC 9.4.3 firmware<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu: update PSP 13.0.6 firmware<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu: update SDMA 4.4.2 firmware<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu: update SMU 13.0.6 firmware<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu: update navi12 firmware<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu: update renoir firmware<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu: update navi14 firmware<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu: update GC 11.5.0 firmware<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu: update PSP 14.0.0 firmware<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu: update VCN 4.0.5 firmware<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu: update GC 11.5.1 firmware<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu: update PSP 14.0.1 firmware<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu: update VCN 4.0.6 firmware<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu: update sienna cichlid firmware<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu: update GC 11.0.1 firmware<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu: update PSP 13.0.4 firmware<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu: update VCN 4.0.2 firmware<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu: update green sardine firmware<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu: update navy flounder firmware<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu: update dimgrey cavefish firmware<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu: update vangogh firmware<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu: update beige goby firmware<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu: update picasso firmware<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu: update GC 11.0.0 firmware<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu: update PSP 13.0.0 firmware<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu: update VCN 4.0.0 firmware<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu: update vega10 firmware<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu: update GC 11.5.2 firmware<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu: update PSP 14.0.4 firmware<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu: update vega12 firmware<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu: update PSP 13.0.8 firmware<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu: update PSP 13.0.5 firmware<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu: update VCN 3.1.2 firmware<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu: update GC 11.0.3 firmware<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu: update PSP 13.0.10 firmware<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu: update SMU 13.0.10 firmware<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu: update raven firmware<br>
<br>
&nbsp;amdgpu/aldebaran_mec.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; | Bin 268576 -&gt; 268736 bytes<br>
&nbsp;amdgpu/aldebaran_mec2.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |=
 Bin 268576 -&gt; 268736 bytes<br>
&nbsp;amdgpu/aldebaran_sdma.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |=
 Bin 34304 -&gt; 34304 bytes<br>
&nbsp;amdgpu/aldebaran_sjt_mec.bin&nbsp;&nbsp;&nbsp;&nbsp; | Bin 268576 -&g=
t; 268736 bytes<br>
&nbsp;amdgpu/aldebaran_sjt_mec2.bin&nbsp;&nbsp;&nbsp; | Bin 268576 -&gt; 26=
8736 bytes<br>
&nbsp;amdgpu/aldebaran_smc.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; | Bin 242688 -&gt; 242688 bytes<br>
&nbsp;amdgpu/aldebaran_ta.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; | Bin 140288 -&gt; 140288 bytes<br>
&nbsp;amdgpu/beige_goby_ce.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; | Bin 263296 -&gt; 263296 bytes<br>
&nbsp;amdgpu/beige_goby_me.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; | Bin 263424 -&gt; 263424 bytes<br>
&nbsp;amdgpu/beige_goby_mec.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |=
 Bin 268720 -&gt; 268160 bytes<br>
&nbsp;amdgpu/beige_goby_mec2.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin =
268720 -&gt; 268160 bytes<br>
&nbsp;amdgpu/beige_goby_pfp.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |=
 Bin 263424 -&gt; 263424 bytes<br>
&nbsp;amdgpu/beige_goby_ta.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; | Bin 238848 -&gt; 238848 bytes<br>
&nbsp;amdgpu/beige_goby_vcn.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |=
 Bin 587120 -&gt; 587376 bytes<br>
&nbsp;amdgpu/dimgrey_cavefish_ce.bin&nbsp;&nbsp; | Bin 263296 -&gt; 263296 =
bytes<br>
&nbsp;amdgpu/dimgrey_cavefish_me.bin&nbsp;&nbsp; | Bin 263424 -&gt; 263424 =
bytes<br>
&nbsp;amdgpu/dimgrey_cavefish_mec.bin&nbsp; | Bin 268720 -&gt; 268160 bytes=
<br>
&nbsp;amdgpu/dimgrey_cavefish_mec2.bin | Bin 268720 -&gt; 268160 bytes<br>
&nbsp;amdgpu/dimgrey_cavefish_pfp.bin&nbsp; | Bin 263424 -&gt; 263424 bytes=
<br>
&nbsp;amdgpu/dimgrey_cavefish_sos.bin&nbsp; | Bin 210416 -&gt; 210416 bytes=
<br>
&nbsp;amdgpu/dimgrey_cavefish_ta.bin&nbsp;&nbsp; | Bin 238848 -&gt; 238848 =
bytes<br>
&nbsp;amdgpu/dimgrey_cavefish_vcn.bin&nbsp; | Bin 587120 -&gt; 587376 bytes=
<br>
&nbsp;amdgpu/gc_11_0_0_me.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; | Bin 310784 -&gt; 310784 bytes<br>
&nbsp;amdgpu/gc_11_0_0_mec.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; | Bin 406528 -&gt; 406528 bytes<br>
&nbsp;amdgpu/gc_11_0_0_mes1.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |=
 Bin 217184 -&gt; 217312 bytes<br>
&nbsp;amdgpu/gc_11_0_0_mes_2.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin =
253360 -&gt; 255248 bytes<br>
&nbsp;amdgpu/gc_11_0_0_pfp.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; | Bin 229328 -&gt; 229456 bytes<br>
&nbsp;amdgpu/gc_11_0_1_me.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; | Bin 263424 -&gt; 263424 bytes<br>
&nbsp;amdgpu/gc_11_0_1_mec.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; | Bin 268704 -&gt; 268704 bytes<br>
&nbsp;amdgpu/gc_11_0_1_mes_2.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin =
252800 -&gt; 254784 bytes<br>
&nbsp;amdgpu/gc_11_0_1_pfp.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; | Bin 263424 -&gt; 263424 bytes<br>
&nbsp;amdgpu/gc_11_0_2_me.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; | Bin 310784 -&gt; 310784 bytes<br>
&nbsp;amdgpu/gc_11_0_2_mec.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; | Bin 406528 -&gt; 406528 bytes<br>
&nbsp;amdgpu/gc_11_0_2_mes1.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |=
 Bin 217536 -&gt; 217664 bytes<br>
&nbsp;amdgpu/gc_11_0_2_mes_2.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin =
253264 -&gt; 255056 bytes<br>
&nbsp;amdgpu/gc_11_0_2_pfp.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; | Bin 229312 -&gt; 229472 bytes<br>
&nbsp;amdgpu/gc_11_0_3_me.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; | Bin 310800 -&gt; 310800 bytes<br>
&nbsp;amdgpu/gc_11_0_3_mec.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; | Bin 406528 -&gt; 406528 bytes<br>
&nbsp;amdgpu/gc_11_0_3_mes1.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |=
 Bin 217280 -&gt; 217376 bytes<br>
&nbsp;amdgpu/gc_11_0_3_mes_2.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin =
253424 -&gt; 255312 bytes<br>
&nbsp;amdgpu/gc_11_0_3_pfp.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; | Bin 229312 -&gt; 229472 bytes<br>
&nbsp;amdgpu/gc_11_5_0_mes_2.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin =
252992 -&gt; 254624 bytes<br>
&nbsp;amdgpu/gc_11_5_1_imu.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; | Bin 132352 -&gt; 132352 bytes<br>
&nbsp;amdgpu/gc_11_5_1_me.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; | Bin 263424 -&gt; 263424 bytes<br>
&nbsp;amdgpu/gc_11_5_1_mec.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; | Bin 268704 -&gt; 268704 bytes<br>
&nbsp;amdgpu/gc_11_5_1_mes_2.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin =
253280 -&gt; 255168 bytes<br>
&nbsp;amdgpu/gc_11_5_1_pfp.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; | Bin 263424 -&gt; 263424 bytes<br>
&nbsp;amdgpu/gc_11_5_1_rlc.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; | Bin 161040 -&gt; 161040 bytes<br>
&nbsp;amdgpu/gc_11_5_2_imu.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; | Bin 132352 -&gt; 132352 bytes<br>
&nbsp;amdgpu/gc_11_5_2_mes_2.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin =
253056 -&gt; 254368 bytes<br>
&nbsp;amdgpu/gc_11_5_2_rlc.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; | Bin 162096 -&gt; 162096 bytes<br>
&nbsp;amdgpu/gc_9_4_3_mec.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; | Bin 269200 -&gt; 268736 bytes<br>
&nbsp;amdgpu/green_sardine_asd.bin&nbsp;&nbsp;&nbsp;&nbsp; | Bin 193024 -&g=
t; 193024 bytes<br>
&nbsp;amdgpu/green_sardine_ta.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 33536=
 -&gt; 33536 bytes<br>
&nbsp;amdgpu/green_sardine_vcn.bin&nbsp;&nbsp;&nbsp;&nbsp; | Bin 403392 -&g=
t; 403904 bytes<br>
&nbsp;amdgpu/navi10_asd.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; | Bin 193024 -&gt; 193024 bytes<br>
&nbsp;amdgpu/navi10_sos.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; | Bin 184512 -&gt; 184512 bytes<br>
&nbsp;amdgpu/navi10_ta.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; | Bin 33536 -&gt; 33536 bytes<br>
&nbsp;amdgpu/navi10_vcn.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; | Bin 403776 -&gt; 403904 bytes<br>
&nbsp;amdgpu/navi12_asd.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; | Bin 193024 -&gt; 193024 bytes<br>
&nbsp;amdgpu/navi12_sos.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; | Bin 204656 -&gt; 204656 bytes<br>
&nbsp;amdgpu/navi12_ta.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; | Bin 33536 -&gt; 33536 bytes<br>
&nbsp;amdgpu/navi12_vcn.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; | Bin 403776 -&gt; 403904 bytes<br>
&nbsp;amdgpu/navi14_asd.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; | Bin 193024 -&gt; 193024 bytes<br>
&nbsp;amdgpu/navi14_sos.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; | Bin 184176 -&gt; 184176 bytes<br>
&nbsp;amdgpu/navi14_ta.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; | Bin 33536 -&gt; 33536 bytes<br>
&nbsp;amdgpu/navi14_vcn.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; | Bin 403776 -&gt; 403904 bytes<br>
&nbsp;amdgpu/navy_flounder_ce.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 26329=
6 -&gt; 263296 bytes<br>
&nbsp;amdgpu/navy_flounder_me.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 26342=
4 -&gt; 263424 bytes<br>
&nbsp;amdgpu/navy_flounder_mec.bin&nbsp;&nbsp;&nbsp;&nbsp; | Bin 268720 -&g=
t; 268160 bytes<br>
&nbsp;amdgpu/navy_flounder_mec2.bin&nbsp;&nbsp;&nbsp; | Bin 268720 -&gt; 26=
8160 bytes<br>
&nbsp;amdgpu/navy_flounder_pfp.bin&nbsp;&nbsp;&nbsp;&nbsp; | Bin 263424 -&g=
t; 263424 bytes<br>
&nbsp;amdgpu/navy_flounder_sos.bin&nbsp;&nbsp;&nbsp;&nbsp; | Bin 218608 -&g=
t; 218608 bytes<br>
&nbsp;amdgpu/navy_flounder_ta.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 23884=
8 -&gt; 238848 bytes<br>
&nbsp;amdgpu/navy_flounder_vcn.bin&nbsp;&nbsp;&nbsp;&nbsp; | Bin 587120 -&g=
t; 587376 bytes<br>
&nbsp;amdgpu/picasso_asd.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; | Bin 193024 -&gt; 193024 bytes<br>
&nbsp;amdgpu/picasso_ta.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; | Bin 41984 -&gt; 41984 bytes<br>
&nbsp;amdgpu/psp_13_0_0_sos.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |=
 Bin 268304 -&gt; 268304 bytes<br>
&nbsp;amdgpu/psp_13_0_0_ta.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; | Bin 251136 -&gt; 251136 bytes<br>
&nbsp;amdgpu/psp_13_0_10_sos.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin =
360352 -&gt; 360352 bytes<br>
&nbsp;amdgpu/psp_13_0_10_ta.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |=
 Bin 247232 -&gt; 247232 bytes<br>
&nbsp;amdgpu/psp_13_0_4_ta.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; | Bin 234496 -&gt; 234496 bytes<br>
&nbsp;amdgpu/psp_13_0_5_asd.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |=
 Bin 193024 -&gt; 193024 bytes<br>
&nbsp;amdgpu/psp_13_0_5_ta.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; | Bin 226304 -&gt; 226304 bytes<br>
&nbsp;amdgpu/psp_13_0_6_sos.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |=
 Bin 385312 -&gt; 774720 bytes<br>
&nbsp;amdgpu/psp_13_0_6_ta.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; | Bin 67904 -&gt; 67904 bytes<br>
&nbsp;amdgpu/psp_13_0_7_ta.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; | Bin 226304 -&gt; 226304 bytes<br>
&nbsp;amdgpu/psp_13_0_8_ta.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; | Bin 226304 -&gt; 226304 bytes<br>
&nbsp;amdgpu/psp_14_0_0_ta.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; | Bin 234496 -&gt; 234496 bytes<br>
&nbsp;amdgpu/psp_14_0_1_ta.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; | Bin 234496 -&gt; 234496 bytes<br>
&nbsp;amdgpu/psp_14_0_1_toc.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |=
 Bin 2560 -&gt; 2560 bytes<br>
&nbsp;amdgpu/psp_14_0_4_ta.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; | Bin 234496 -&gt; 234496 bytes<br>
&nbsp;amdgpu/psp_14_0_4_toc.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |=
 Bin 2560 -&gt; 2560 bytes<br>
&nbsp;amdgpu/raven_asd.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; | Bin 193024 -&gt; 193024 bytes<br>
&nbsp;amdgpu/raven_ta.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 33536 -&gt; 33536 bytes<br>
&nbsp;amdgpu/renoir_asd.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; | Bin 193024 -&gt; 193024 bytes<br>
&nbsp;amdgpu/renoir_ta.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; | Bin 41984 -&gt; 41984 bytes<br>
&nbsp;amdgpu/renoir_vcn.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; | Bin 403776 -&gt; 403904 bytes<br>
&nbsp;amdgpu/sdma_4_4_2.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; | Bin 34304 -&gt; 34304 bytes<br>
&nbsp;amdgpu/sienna_cichlid_ce.bin&nbsp;&nbsp;&nbsp;&nbsp; | Bin 263296 -&g=
t; 263296 bytes<br>
&nbsp;amdgpu/sienna_cichlid_me.bin&nbsp;&nbsp;&nbsp;&nbsp; | Bin 263424 -&g=
t; 263424 bytes<br>
&nbsp;amdgpu/sienna_cichlid_mec.bin&nbsp;&nbsp;&nbsp; | Bin 268720 -&gt; 26=
8160 bytes<br>
&nbsp;amdgpu/sienna_cichlid_mec2.bin&nbsp;&nbsp; | Bin 268720 -&gt; 268160 =
bytes<br>
&nbsp;amdgpu/sienna_cichlid_pfp.bin&nbsp;&nbsp;&nbsp; | Bin 263424 -&gt; 26=
3424 bytes<br>
&nbsp;amdgpu/sienna_cichlid_sos.bin&nbsp;&nbsp;&nbsp; | Bin 227456 -&gt; 22=
7456 bytes<br>
&nbsp;amdgpu/sienna_cichlid_ta.bin&nbsp;&nbsp;&nbsp;&nbsp; | Bin 366336 -&g=
t; 366336 bytes<br>
&nbsp;amdgpu/sienna_cichlid_vcn.bin&nbsp;&nbsp;&nbsp; | Bin 587120 -&gt; 58=
7376 bytes<br>
&nbsp;amdgpu/smu_13_0_10.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; | Bin 271520 -&gt; 271520 bytes<br>
&nbsp;amdgpu/smu_13_0_6.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; | Bin 2584 -&gt; 3748 bytes<br>
&nbsp;amdgpu/vangogh_asd.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; | Bin 193024 -&gt; 193024 bytes<br>
&nbsp;amdgpu/vcn_3_1_2.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; | Bin 579248 -&gt; 579376 bytes<br>
&nbsp;amdgpu/vcn_4_0_0.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; | Bin 391888 -&gt; 392560 bytes<br>
&nbsp;amdgpu/vcn_4_0_2.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; | Bin 391888 -&gt; 392560 bytes<br>
&nbsp;amdgpu/vcn_4_0_4.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; | Bin 391888 -&gt; 392560 bytes<br>
&nbsp;amdgpu/vcn_4_0_5.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; | Bin 391120 -&gt; 391792 bytes<br>
&nbsp;amdgpu/vcn_4_0_6.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; | Bin 391120 -&gt; 391792 bytes<br>
&nbsp;amdgpu/vcn_4_0_6_1.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; | Bin 391120 -&gt; 391792 bytes<br>
&nbsp;amdgpu/vega10_asd.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; | Bin 193024 -&gt; 193024 bytes<br>
&nbsp;amdgpu/vega12_asd.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; | Bin 193024 -&gt; 193024 bytes<br>
&nbsp;amdgpu/yellow_carp_ta.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |=
 Bin 226304 -&gt; 226304 bytes<br>
&nbsp;amdgpu/yellow_carp_vcn.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin =
579248 -&gt; 579504 bytes<br>
&nbsp;121 files changed, 0 insertions(+), 0 deletions(-)<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_MN0PR12MB61019C6004EB58D816705465E2742MN0PR12MB6101namp_--
