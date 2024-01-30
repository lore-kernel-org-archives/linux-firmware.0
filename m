Return-Path: <SRS0=POTr=JI=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D647C46CD2
	for <linux-firmware@archiver.kernel.org>; Tue, 30 Jan 2024 15:43:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 677A9C433F1; Tue, 30 Jan 2024 15:43:26 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2045.outbound.protection.outlook.com [40.107.220.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3D907C433C7;
	Tue, 30 Jan 2024 15:43:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3D907C433C7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iBOLkWyby9jAgMrO90LswLR8tNi4wvf9UAU+B2i9mb9PtB98Cjod6hhnKCKqz1M0+fU8bBoYnc+nSRI10poWNdjir4Z4HhoMcQUliPU5D5OuF4QqMlCXFuKsCOBV6r+LY/ENPcDEQHM+4HZ2oi+aFipkWrDiS4wz2PcV7WnmeIFAMRDaODb2Mfz8EiKnUCAyTQtsWpUAVWH2fTjDJyF5q+RBZmbNNRnuo1Ey+01AMEn0OWGSyBJL07A7ZU9jB0thvkeTlRvkkvHSOifMwnQO0wu42Cj+bXiT6/xYCoZGd+XLO+aBXngiLRIdXabpXrVd0Gs7kzZY8z2jbDDZ8hs7pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=doCyrYs0O1eQJJhhgg0dSLlQ6a43Xt2SYo08udRVEvQ=;
 b=V8PICiDLqRyFD1+tk3UrMDoyQKARtdw7ojvt76a9KFGQGoYnq+FEbCGMKtzlrL/RnqsYmBamnMzJaXNa5+gubNiD+JFY8J6z5O1WMmzW+nSJWx/S1VKtp4EHq4Z+KpyvChT57S4htYI0eG//TIy/GQJl8M7Ru6qVthIOil2zzZMQwVdz42Tsxolcz6ZjvjiU/dzz7Ustv36bWuEB8el6HdAXiNnNU0tscZkPDoXJ36Dmhelnk6wqzDStf8fdVXcrjiS1ksPG/jX8z1K291wtaHZM+3gBt7PnJ+kuBUejoWfFCvs6OHnremQujp509N4l8IqMxkfmESjynferlbH7RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=doCyrYs0O1eQJJhhgg0dSLlQ6a43Xt2SYo08udRVEvQ=;
 b=B8Tvln9TFP1gH4dQADFuv3u1vYhTkqT1YpgqgDa6qg23M0WXvggh8UfAu5jrwif/CKheYzvFx7IG+8jEh1d6NfWqEyLRJDV/37w7ia6YGWJz2S99uG92uidgTJlxEAPpMVPvgqbZN+QMPH2bwxHLyNrrPs8wn3e52KMof0ABHKg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CY8PR12MB7659.namprd12.prod.outlook.com (2603:10b6:930:9f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Tue, 30 Jan
 2024 15:43:22 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::c30:614f:1cbd:3c64]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::c30:614f:1cbd:3c64%4]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 15:43:22 +0000
Message-ID: <95a91938-4fe5-4d17-9349-294181a53f78@amd.com>
Date: Tue, 30 Jan 2024 09:43:20 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [pull] amdgpu amd-2024-01-30
List-Id: <linux-firmware.lore.kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>, linux-firmware@kernel.org,
 jwboyer@kernel.org, "Chung, ChiaHsuan (Tom)" <ChiaHsuan.Chung@amd.com>
References: <20240130141251.2493810-1-alexander.deucher@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240130141251.2493810-1-alexander.deucher@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR01CA0017.prod.exchangelabs.com (2603:10b6:805:b6::30)
 To MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CY8PR12MB7659:EE_
X-MS-Office365-Filtering-Correlation-Id: 6677de7d-0330-49ad-ae59-08dc21aa30ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IPEwBUk7KhCNlTcOHbPKK0deN72iZJg6D+/fJMnsclGg7GhFlfI+ZVvatMODwRkkyksje5x0WXI30y8HBhmsWpl8CKK7xOt5v854BkuNSOTiEKgR1a2gdrG1M+D9SLKHAJB1CYfZeIVxp24m8BWsLckA0bXkQwroS/6mMAsNhl5kkq2G+ZqkCD8pipB7vrAalprMVlzBGFmw30U0u805dqj+UXrisgpDtRW1JI+ZegumiQ2fmLtjPR5QlxpFw21V+uKF3t4A9c3qXEigDNyFlP+Uev8Gsbchyi0RhrZI3ol+LT+S0ze4AooPKtY36UriQIQZHdo2GHwX+70RlHnMFy2Qr8t+t0klN8cfi/Ve1rceqBx+uy+CAxHzt1XAz7KNbXTx9liOrWrNu0PDKtJmtekqS4N3lic6F93r7+TORxjY3Z6RjFLnFQWH6k8lbS/thgcvh6h9HCAkS3znk27Q3o6k8JBtklmOWe4TiZYpqlp4IC9MSp1TyhNyZQi2zBJbtPXrxEcxBpwY7VAmnRGzQC4+GMwKYCae5Q9ejwiwmfTy2oN8eZXuTZngz1V6hlmWUhcfNv+MwexQ5Y/C811Jng5rDNfgyKchqyGNl3Z1zifbAGky2MwfC9JqLdp6Jby9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(346002)(376002)(39860400002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(41300700001)(2616005)(26005)(31686004)(6512007)(6636002)(6486002)(6506007)(966005)(316002)(36756003)(478600001)(83380400001)(53546011)(38100700002)(44832011)(66556008)(5660300002)(31696002)(2906002)(86362001)(8676002)(66476007)(110136005)(450100002)(66946007)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OTArUkNuRnNCdFVDY2hZUEFDcTZtc055N2dudWZiSkFOU0dxUTI5Q1luRjJY?=
 =?utf-8?B?emxzOGVoeXlNb3F2Y1hFYmJySWJScDlZZzRhMnNtR0hnaEpNQnFlS1dPbmZt?=
 =?utf-8?B?T3hLYTdWZE9wV2UxL3ZiR1BBZXlYeVNZMlRUcXA4ZFFJSlF2eWJhN0tYdHNZ?=
 =?utf-8?B?M29qVkxWb1IzNFgzblFCOHltdTBZVE9RRWhsc2h2eVFSd1prTEtxS1BIeDh0?=
 =?utf-8?B?VzNQRnd3dFc3TUY0enZmeSs0dElYS0dHdE01bnBJTlpvRDlMRDA5N0JPV0hN?=
 =?utf-8?B?amx0NmE2alFEbENzN2VYb2Jhc1dCVXF6UzJEanh2eTJMeit1R0x4cXZXVVNH?=
 =?utf-8?B?SjhnTWxBMjd0Z1ZJWS9YOTBkcy9meU83SlZ1anRDZDZxT0JRNHk4OXZyejlV?=
 =?utf-8?B?VDI2bExYNFpxZVNGeU1hREp3VkhxdHNYU1BNK2xRcUl1UmZ4Mm5NNjRzOE9D?=
 =?utf-8?B?TVQzZHIzVzEyMVliMURxSkJoTXdDblAvQTFHTWdIakJubDkwNUtsZlFIOEFs?=
 =?utf-8?B?YklWYUQ1Y0ViRlpyY3ZlWm85V3hDT1ZFc3RuWHBKaXI1WnVFNWtRZWhYY01V?=
 =?utf-8?B?RnhHd2tqTVljNGRHV0FucVM5MjNNam11YnhBakU4alVzSGFKeEVxbWFvWDRV?=
 =?utf-8?B?Mll5cWtKSTltck5IejBVckZWbFplS0E3bTRrd2hIMEIrQitFT2JsWHNhRE9a?=
 =?utf-8?B?eC9qTWdpMFlCSnV6dmlwUmxmb1RIS2tmdmp0VFU1TFZlRFVabDZqL3pLSkNT?=
 =?utf-8?B?dnMwb3g0cjRhVFBKOWg1dlFDWlFsc3ptZFQ0amd1cE5RaHJscjBDWVpRODdt?=
 =?utf-8?B?YU1wdFRiNks3Nm42QitQMzZ3aGdsMXN1UGpkYkVCNUZWRDNoaGkzc2dXM1Fr?=
 =?utf-8?B?Kzl6enRSdVQzQ2RRa2o5MFRaOWtyMUJSdHZWMVJLZFRXbU5GbWRUelNSL1U3?=
 =?utf-8?B?eDN1ZFhORW5mVmpMZWpTWldob3ZzTFE4MlZ1dTdhUHFjLzNKdi9JNEtNb0xL?=
 =?utf-8?B?SjI4cUttVUpJTHlsVG9aM3Zqd2FyUm1oZXcvV0xkWXhOKzF1NGZBbk5TNmRJ?=
 =?utf-8?B?dVJBaUhDQUxtYS8xYzVhOURDWU05SDZmSnlEcWRBcGpSQ2lvUFlUV2s5Y0Vl?=
 =?utf-8?B?S1Bqa2JvRURUQlI1Q2lwWUR2VGUyWnNWSVl1WTU1QXNTSjNPeUpvRWxFTlRK?=
 =?utf-8?B?STlVSmhqc1BLR0ZDdHNpN2JkV1FVb1RXNnlHMXVqUnZWWGlHTGVoci80YS80?=
 =?utf-8?B?ZFVZTklKMzcvYllJemEwRDAxdklkbFF6a3VSeHFPTnpRc2w0Z08zMTI5ZWU2?=
 =?utf-8?B?Q0dYVkhRdVhvY3M0QUR3S3c5VGd6T0dpUzBsSjFsb3FsaVAvRmFkTG43Z0dN?=
 =?utf-8?B?M2xob1ZYNW9lZTNTNSs1WE5rS3dLSitkMEtJWU1KcW5EZ2dvUnYvNU1WVUs3?=
 =?utf-8?B?cnZmeENiL3VscmsyK1YwbldFVVphNXFSc3d6ZmFFa1hnL1ZuR0RQcVprczg4?=
 =?utf-8?B?ZnlmdjdKNHRpWDZ4bkFyd2QrL1BEdFdKWVFkTHdwRm0rakZHbzFNbGZuKzht?=
 =?utf-8?B?SWlqdERlaEpTbG1Xd0JjV1JEd2xzK00wTEpUNkEzSkNSblRlSTJLWGRna2da?=
 =?utf-8?B?S0x6U295SHR1ZVFDSTc4UGJLZW9haE1MWHBrczBnekNRT2gzblZPZ2NDaXlp?=
 =?utf-8?B?T1BQR3hwNHoyZHZab09oei9XbG16Y3h2cll1bUR3Ui94YzNueXQvNytLRFV2?=
 =?utf-8?B?UlRWOGE4TEZTM1UwdCtXYVNtdEZmV0pGWDlzSm1zZExaMnIvaDVKdXl4eFM1?=
 =?utf-8?B?OExlSW1DdnBtcGdmTTBHV2w1N3E3YXRyaUdqTldobE5IZ0RRSFFrYWpZZEdn?=
 =?utf-8?B?ZllzcDVjY1cwSHd5NlE1UzRJd01QQnR0dTZSQTNIUk10TjBuVHRmeVFYNjJC?=
 =?utf-8?B?WkZ4N3BNME9BN1VYM2N3RW5DaHg5Zlk1bzhIOW9iaDJudjMvbThYbkVKVzEw?=
 =?utf-8?B?RnBCam5zRlFOTWhrMllzeW1zN1RPNFJXL2VJbEdCNitieS9tUUVjVGtFczZh?=
 =?utf-8?B?OUhQaXZuRFVkR0habDhBUXA5QStVbkt1YUlPZmZ2Tzg3a1ZBR2haSUJ5MEVt?=
 =?utf-8?Q?Tg/yYky9E3mrOBR8sB2hufwlu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6677de7d-0330-49ad-ae59-08dc21aa30ba
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 15:43:22.7273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NFofj0AFXHOZOUM3qqcL6etPMp+CcKGd8jVU9P9L9aIhaeG9isvQ4gnmlUErIih8oOtjzSCOo4GZ1qs9Ooxc1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7659

+Tom

On 1/30/2024 08:12, Alex Deucher wrote:
> Hi,
> 
> Updated firmwares for RX7900 to fix reported issues in gitlab.
> 
> The following changes since commit 0982b6be090d765416e8ff7fa311fb5b177b6692:
> 
>    amdgpu: DMCUB updates for various AMDGPU ASICs (2024-01-29 11:32:52 +0800)
> 
> are available in the Git repository at:
> 
>    https://gitlab.freedesktop.org/drm/firmware.git tags/amd-2024-01-30
> 
> for you to fetch changes up to c8c69cb95b876c12c2bcb74fdecc5cd7f587a882:
> 
>    amdgpu: update SMU 13.0.0 firmware (2024-01-30 08:55:15 -0500)
> 
> ----------------------------------------------------------------
> amd-2024-01-30:
> 
> Updated GC, PSP, SMU firmware for RX7900.
> 
>  From internal git commit:
> 3c4bdae3eab9efad8922cebd5b3c6583bb84751e
> 
> ----------------------------------------------------------------
> Alex Deucher (3):
>        amdgpu: update GC 11.0.0 firmware
>        amdgpu: update PSP 13.0.0 firmware
>        amdgpu: update SMU 13.0.0 firmware
> 
>   amdgpu/gc_11_0_0_imu.bin   | Bin 132352 -> 132352 bytes
>   amdgpu/gc_11_0_0_me.bin    | Bin 298320 -> 379952 bytes
>   amdgpu/gc_11_0_0_mec.bin   | Bin 407072 -> 407072 bytes
>   amdgpu/gc_11_0_0_mes1.bin  | Bin 216832 -> 216032 bytes
>   amdgpu/gc_11_0_0_mes_2.bin | Bin 244144 -> 242512 bytes
>   amdgpu/gc_11_0_0_pfp.bin   | Bin 228096 -> 229152 bytes
>   amdgpu/gc_11_0_0_rlc.bin   | Bin 185248 -> 185248 bytes
>   amdgpu/psp_13_0_0_sos.bin  | Bin 268304 -> 268304 bytes
>   amdgpu/psp_13_0_0_ta.bin   | Bin 247040 -> 242944 bytes
>   amdgpu/smu_13_0_0.bin      | Bin 292452 -> 292452 bytes
>   10 files changed, 0 insertions(+), 0 deletions(-)

This also happens to include amd-2024-01-29 which wasn't merged.

Tom had made a mistake when he sent it, but it also caused a regression 
so he didn't fix his mistake and re-send.  To avoid pulling in the 
broken commit I'll revert it and make a tag and MR for it.

