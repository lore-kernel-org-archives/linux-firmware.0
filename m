Return-Path: <SRS0=Ms1n=EP=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A087C83F15
	for <linux-firmware@archiver.kernel.org>; Wed, 30 Aug 2023 15:51:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CF242C433C8; Wed, 30 Aug 2023 15:51:11 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5C960C433C7;
	Wed, 30 Aug 2023 15:51:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5C960C433C7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=feGTdv5vhwC0bfFbDlvoVwTvCNgYiTTkGSBQ9xnlSUtv6+9NYQTmcoShqP1WCBmMmChPoAhtDIq+W3LXbTpxaA5diheIQ++YkDkSCs5o68IcvlTq8P4AfEPyH5psnQBb80qWyj/yJjlVjgwVuDakRPyVvPFBYxx+phpRIiX393ZWdnqd9uSOU7Zv4HROaqIEvkrDNfVv73gebp3Y1OiUx4LRxeHH2iMRmmM0JIKuPo9Vu8Mwhb78AloShmk/CdNiWkVEElSKS0av9XHKC4UhQ8HU0k5p8s7XKWibJncsYecIYH/X4D3JdLW2KoB6v9tGzVXFqJakrmYEGRVaAGNxXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J3B1+ZFFSgV6BiaGHbNItlZb+5vsQ/BHSrW2XjMwT8U=;
 b=X5fuoa2oSKK2uh4o6w1sMUMyXw/wJBexhU85hE3E8zCEVSINEGIgNwL2CQC1h1MDvTWc99SuC9kvIWInFsJShaLsdODZff2VFpK9JduGbjW7CLBpSRZhT/6mnXO2Baznzahkoob3iCazr9PbFcOZZEjsncTjUUsvOp96AxRNe/G3D5UWd1H3gBC0XU3CnM80Vwe7eD9Y0NJMK5xKxnVBZs7xcQS3p8A+8nAs2EqupYVwoYzbN0FjfMD+549SC/AcCWQdHw2Oc3NlJmiquG9hE38M80LPopf8+oDwW+f+iDgbK2I9EfDlbkqvn9lHXNvH4iUKgFHUMr0wYRMi7iPwlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J3B1+ZFFSgV6BiaGHbNItlZb+5vsQ/BHSrW2XjMwT8U=;
 b=MNaCPEELcN3mszi1zZ4k/D5vkg5q2myn0e6gsE/QGmMqX+GDEH3NY7reoivY6+7V6l6PMWfZubN9/NsIR6aZCaPScoXifuHZEiDvUTFlcxZcgziUD24hfZ/27lpIXn8bY3rBbuxyqjVdsITdse7NAQUwB10q4brxSw31XaLpsRg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ2PR12MB9163.namprd12.prod.outlook.com (2603:10b6:a03:559::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Wed, 30 Aug
 2023 15:51:06 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::36f9:ffa7:c770:d146]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::36f9:ffa7:c770:d146%7]) with mapi id 15.20.6745.020; Wed, 30 Aug 2023
 15:51:06 +0000
Message-ID: <2c9a6fcf-e4dd-4ba5-abf6-9f6d6f6dc3e1@amd.com>
Date: Wed, 30 Aug 2023 10:51:02 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/20] Add preparations to be able to run in a CI/CD
 system
Content-Language: en-US
To: Josh Boyer <jwboyer@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
References: <20230815180018.25554-1-mario.limonciello@amd.com>
 <60fcf13c-c1bb-46f4-86bc-d3c674d0bf4b@linaro.org>
 <CA+5PVA4DjHCn_zDoFOimr7NW5GpN8+zTVWJEAmo+c6biCHEicg@mail.gmail.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CA+5PVA4DjHCn_zDoFOimr7NW5GpN8+zTVWJEAmo+c6biCHEicg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0100.namprd04.prod.outlook.com
 (2603:10b6:806:122::15) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ2PR12MB9163:EE_
X-MS-Office365-Filtering-Correlation-Id: e6b46317-8a25-4c2d-45df-08dba970eba0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UyWDhYgD6PH9tYW55EFgLby/FxauRZJa11xTX+CmmcNl6Nk7X8sa58OG5zjAwasajRGdhUvcxAnbcS1SCe4inh+bOhtoVmQQC9F/67Vf9R6kDuViabWmXav05Z3X5ZcNuEfShrQpPqRXFFomqYtBvP+dd4us342sOqpH3s4x255QjGoOyRY5+nfwLpY6PcArHq7E7m4TGP4QPGf2BFwlb9cc5gysxSgwvSyUyJwQ9hOR8/rA8KWaxcYxK5oPzPDF5OPOR2FVPLrdHn6zmSP5YMNJrgP20IyYqbuu4fdc8GWpXxWDvptoYE2NttTuG3xL5T7gT8nI0fX4kcq/pvraXOYjGWw3wL53ypEhjaPhT6GOlQ98Fs9zv+bpuqn9Mpt+/ZNz8vZLBTaXGExOpsI9nRfCpO4+CcO0TwPHoE7bYqNmL//ucpPwgInFKAEgtYnIJuY+A0N1x9ZP0lTbRucU5lOR1BOfqMDq7PuK5IDhiPk8NAwC+2Dc4VCm4YwwgfgyNcu7AV2Ru3S+jNfM83Ka6ttsEbs/A+4rcrh+1SjlwfQc615uk7mcrm7Z2Xey3cOKg4bYLxBJZxCxdkS4GcyEX+i+bYu70yEvowJU97ZJgUSVLev5c4BGHa97na6WNYAnUSLVKmaQ029DOFY92aiU2aSnojpNDsU/HUB36qRaZ9lf/Ot5+wytY7QYgpNTTXimuygbBa5JuHMOWQoGGYSymw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(366004)(346002)(136003)(396003)(186009)(1800799009)(451199024)(6506007)(6486002)(6512007)(6666004)(53546011)(83380400001)(19627235002)(26005)(478600001)(30864003)(110136005)(316002)(41300700001)(66556008)(66476007)(66946007)(4326008)(5660300002)(8936002)(2906002)(44832011)(8676002)(36756003)(86362001)(2616005)(38100700002)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHJjR3ZncWxGQ1RpY2tVQnNCTTBwY3A5andUSjB5VzRLR2FjSmFwYXhMMlBk?=
 =?utf-8?B?V29OTll3R3hyL3pkZnVqZVZQSWl6L2ZTdVFENzBzMHh0QUpRaGY5VC9LQTVJ?=
 =?utf-8?B?dC9kNVJXTFlOS0RIL1dZV0dyWkYrNXZIdEtNU2NPd2t3amhQK084ckFqL2hQ?=
 =?utf-8?B?Y3p5R1JtaVNRbEJHT0t4U3kvS21SVGc2NndrbXkwVCszaE5EVysrcVg4Y3dX?=
 =?utf-8?B?MGtTZGh0cVVkZW11Y2d5ZHpOeWs2U0lxczVoNFpqL1RRdWVabGF1cUhhK1NT?=
 =?utf-8?B?VllieUVZdERLbFgvSVNJTTRBUWdXdVZNbnlSOGZybUtHNmFTSUhJbGxyVjlw?=
 =?utf-8?B?VFVOT1o0RmFHYkJsOVFsZ3hYL3JPUkFMdEN4cmpURmpYcElUVmk4QWNKV2M1?=
 =?utf-8?B?b2Z0b1lmNXJJcUVuSmxhOHkwT0RUT2Y0TUt4TE1KZGJBL284U1llUm5URi9M?=
 =?utf-8?B?bUg0T0ZiSHJCM3VVdnF5Uy9qTmRsQkIvRWJ1eXdaZE1QUnRXQWlBbDBXaFN4?=
 =?utf-8?B?M3FaNDJ0WGlRSExOeWZtTGl6TFdKODJCT2x6MjZLamZ2OVNYYnBEWEM5c3J2?=
 =?utf-8?B?V3dza2Y3ZzZNYU50QXBKLzdDdHFSVWVKUitmOUpKUk9HbHZuYmhEbFRZZWRH?=
 =?utf-8?B?NTZoNk1QTkMwdkhzNmxpOEtETFEwVzlJQ3MzZTVLQVMyb1h4N2xDbzZsK3Fn?=
 =?utf-8?B?MFhiZmZJMTllOCtIb29KUUtJMVZZWGZwVGo2V2VHZkRGK0V1aFFsS3l0T1RL?=
 =?utf-8?B?bzg2MU9yVWFPMUptTjJ3cjBhNlJPak9PZWFDNm1VN2pjRjdiSkdsd2FpTGlq?=
 =?utf-8?B?QUFHT2E0ZkJpZ041d3RsaDczR1lGa3IxbzhuM2puRHhxK2NmR0ZHUkt3bXcz?=
 =?utf-8?B?bjRaejZ6VGFGcWxDZWs5K0RPeTFxdXRoL0lvZzBWdWZFNk13M1MrN0xHYno5?=
 =?utf-8?B?ZlJqcE1TNTg4VitySG1ia0JMSlp2ZCtWdjJ4T0p1aFdXRDRIMEE1aElONW5Z?=
 =?utf-8?B?SG1HOWVpSkUyYjBuQzJRMm1LRkdUSnpUclBhdGNmOEYyUVpBSzZLOUZHNGs1?=
 =?utf-8?B?WVdRaHQzZlcwS2hpNWZmc29zZTZVVXlETXJaN3ZYNXpHZDg1SXdscWJPQmg4?=
 =?utf-8?B?NW5sOVRuak9jL014WXlnR292R21xWTI2MjdYYjM1czV1ci9NcjlINkIyckVy?=
 =?utf-8?B?RkU3ZDVvbkRla2l6RGlDR2lFWENEZFk2QmZkcWw2VmYwUW9EemZjRm80Rndq?=
 =?utf-8?B?M2ltazMwdmJQblFaMUhNUmNDaUtLTldOVHR5bE16MWxlcmVNVDhMMmFaRmhk?=
 =?utf-8?B?bjViaXh3WVk1SDFIMk1MM0tZN0tDc0dKVk51d1dEM1lVV2JYcTRJVlc4QW02?=
 =?utf-8?B?eU1XcUF1OXcvODZSdlVnQk1rK0hqTnZ3WEo4c3VLUkVBR2oxTm1sdjBvZ1h4?=
 =?utf-8?B?aVErQ2pJdzZJSWUwZGdsUHE1Z2tJcXptV0hBSTlYem5rdUwrZ3dhdHArZFJh?=
 =?utf-8?B?UXBtd1ZxN2FUUUJnOWxhTGZ5Vi8zVjNKV3pvbDYwU092NXIwVmFiV2EzRjky?=
 =?utf-8?B?VVBjRDA3ZG1rUGZ2RG1iRlc4RWx3djFGVUdjNWp6cXAyeG4yeDdKaGV1UHZP?=
 =?utf-8?B?UWpuaE4zcEhYRFYyWUZjbFRsL1hwNjdGSVJGNkhiODZ0QnptU0o3LzZheWwz?=
 =?utf-8?B?ZFdZaEthaHdodWZYcitGbmRDalRnd2c4ai80alFjQ1VhVmZiRXF0YzBVYnU0?=
 =?utf-8?B?b2FpQ3BGZk52K3pXUFJUeEdWZkpXV2oxU2R2eHN5SWZWUk52ZmNqZGNqRlZM?=
 =?utf-8?B?VXArQ3RmZVdqdEZJUFh1VXBwUWZiU09DQ0lYZ3BkVUZRV2pWM2V0MTVIZ3VJ?=
 =?utf-8?B?ZW5YM2N0cStNTmZtVDJNNVo3Z2pob01wc1JoaXArUGxMWnVjWmtKd21wcC9u?=
 =?utf-8?B?eFFrWkJlZkR2MlpYTGNsc3duK3YxcXRLbm1lbUoxOUx0R25yYzVUMDF2SjFv?=
 =?utf-8?B?U1JSNHZ2cjhCWTRmeFhwRG8xQk5SV3FJdjJsNkFFVEhKSDUrdEF1bEFxdGM0?=
 =?utf-8?B?MklJaEQweEtCbnVGZ0VacnBweVhzMU5RRDJnZC9IRXdOZ1ZNTkE3MlFuSjBm?=
 =?utf-8?Q?kVg0VZTUrniihTJopahd0vH35?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6b46317-8a25-4c2d-45df-08dba970eba0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 15:51:05.9570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EOa2gjw6WRAwGxLGr1EZ28NCt3e48BE35IetTzquNnZ9bF1nALSyPo6hyrV3DvZvUfZOuR9MQ0jhr0V6DLgmAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9163

On 8/28/2023 06:15, Josh Boyer wrote:
> On Fri, Aug 25, 2023 at 1:22 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> Helo,
>>
>> On 15/08/2023 20:59, Mario Limonciello wrote:
>>> If linux-firmware.git or a fork of it is hosted in Gitlab there is the
>>> ability to gate pull requests based on some CI checks.
>>>
>>> The basic ones that come to mind are:
>>> 1. Checking spelling.
>>
>> First, you are renaming a lot of 'licence' files to be named 'license'.
>> This is fine from the US English point of view. Other (e.g. UK) English
>> keep the difference between licence (noun) and license (verb). Not
>> everybody uses the US English, especially for the legal documents.
>>
>> Second, renaming licence files and/or changing their contents doesn't
>> sound right to me. They are legally binding documents, with all the
>> mistakes and typos. They are usually passed through the legal
>> departments, etc. I would not guarantee that one wouldn't consider
>> licence being void after these spelling corrections.
> 
> I agree with Dmitry on these two points.
> 
> We should be able to figure out a way to have any future CI checks
> scan MRs for typographical errors and catch them at that point, but
> doing a blanket rename and cleanup is something we should probably
> avoid for now.
> 
> josh

Thanks for the feedback, understood.

> 
>>
>>> 2. Checking WHENCE.
>>> 3. Checking for SoB.
>>> 4. Ensure that any python scripts pass style for 'black'.
>>>
>>> All of the checks can be triggered by `pre-commit` or by `make check`
>>>
>>> This series cleans up linux-firmware.git so all those would pass and
>>> adds some templates to that effect.
>>>
>>> Mario Limonciello (20):
>>>     ath11k: update typographical errors in the Notice.txt files
>>>     ath10k: correct typographical errors in the Notice.txt files
>>>     i915: correct typographical errors caught by codespell
>>>     adsp_sst: correct typographical errors caught by codespell
>>>     agere: correct typographical errors in LICENSE caught by codespell
>>>     qca: correct typographical errors in NOTICE.txt caught by codespell
>>>     usbdux: correct typographical errors caught by codespell
>>>     dsp56k: correct typographical error caught by codespell
>>>     cxgb4: correct typographical errors caught by codespell
>>>     cavium_liquidio: fix typographical errors caught by codespell
>>>     kaweth: correct typographical errors caught by codespell
>>>     xc5000c: correct typographical errors caught by codespell
>>>     qcom: correct typographical errors caught by codespell
>>>     keyspan_pda: correct typographical errors caught by codespell
>>>     carl9170fw: correct typographical errors caught by codespell
>>>     WHENCE: correct typographical errors caught by codespell
>>>     check_whence: reformat using python black
>>>     Add CI/CD with ci-fairy
>>>     Wire up pre-commit to `make check`
>>>     Rewrite README in markdown
>>>
>>>    .codespell.cfg                                |   4 +
>>>    .gitignore                                    |   1 +
>>>    .gitlab-ci.yml                                |  22 +
>>>    .pre-commit-config.yaml                       |  33 ++
>>>    LICENCE.Abilis => LICENSE.Abilis              |   0
>>>    LICENCE.IntcSST2 => LICENSE.IntcSST2          |   0
>>>    LICENCE.Marvell => LICENSE.Marvell            |   0
>>>    LICENCE.NXP => LICENSE.NXP                    |   0
>>>    LICENCE.Netronome => LICENSE.Netronome        |   0
>>>    LICENCE.OLPC => LICENSE.OLPC                  |   0
>>>    LICENCE.adsp_sst => LICENSE.adsp_sst          |   4 +-
>>>    LICENCE.agere => LICENSE.agere                |   2 +-
>>>    ...heros_firmware => LICENSE.atheros_firmware |   0
>>>    ...oadcom_bcm43xx => LICENSE.broadcom_bcm43xx |   0
>>>    LICENCE.ca0132 => LICENSE.ca0132              |   0
>>>    LICENCE.cadence => LICENSE.cadence            |   0
>>>    LICENCE.cavium => LICENSE.cavium              |   0
>>>    ...cavium_liquidio => LICENSE.cavium_liquidio |   4 +-
>>>    ...elsio_firmware => LICENSE.chelsio_firmware |   0
>>>    LICENCE.cnm => LICENSE.cnm                    |   0
>>>    LICENCE.cw1200 => LICENSE.cw1200              |   0
>>>    LICENCE.cypress => LICENSE.cypress            |   0
>>>    LICENCE.e100 => LICENSE.e100                  |   0
>>>    LICENCE.ene_firmware => LICENSE.ene_firmware  |   0
>>>    LICENCE.fw_sst_0f28 => LICENSE.fw_sst_0f28    |   0
>>>    LICENCE.go7007 => LICENSE.go7007              |   0
>>>    LICENSE.i915                                  |  78 ++--
>>>    LICENCE.ibt_firmware => LICENSE.ibt_firmware  |   0
>>>    LICENCE.it913x => LICENSE.it913x              |   0
>>>    ...lwifi_firmware => LICENSE.iwlwifi_firmware |   0
>>>    LICENCE.kaweth => LICENSE.kaweth              |   2 +-
>>>    LICENCE.linaro => LICENSE.linaro              |   0
>>>    LICENCE.mediatek => LICENSE.mediatek          |   0
>>>    LICENCE.microchip => LICENSE.microchip        |   0
>>>    LICENCE.moxa => LICENSE.moxa                  |   0
>>>    ...10ge_firmware => LICENSE.myri10ge_firmware |   0
>>>    LICENCE.nvidia => LICENSE.nvidia              |   0
>>>    ...irmware => LICENSE.open-ath9k-htc-firmware |   0
>>>    LICENCE.phanfw => LICENSE.phanfw              |   0
>>>    LICENCE.qat_firmware => LICENSE.qat_firmware  |   0
>>>    LICENCE.qla1280 => LICENSE.qla1280            |   0
>>>    LICENCE.qla2xxx => LICENSE.qla2xxx            |   0
>>>    LICENCE.r8a779x_usb3 => LICENSE.r8a779x_usb3  |   0
>>>    ...irmware.txt => LICENSE.ralink-firmware.txt |   0
>>>    ...LICENSE.ralink_a_mediatek_company_firmware |   0
>>>    LICENCE.rockchip => LICENSE.rockchip          |   0
>>>    ...rmware.txt => LICENSE.rtlwifi_firmware.txt |   0
>>>    LICENCE.siano => LICENSE.siano                |   0
>>>    ...ti-connectivity => LICENSE.ti-connectivity |   0
>>>    LICENCE.ti-keystone => LICENSE.ti-keystone    |   0
>>>    LICENCE.ti-tspa => LICENSE.ti-tspa            |   0
>>>    ...4-firmware => LICENSE.ueagle-atm4-firmware |   0
>>>    LICENCE.via_vt6656 => LICENSE.via_vt6656      |   0
>>>    LICENCE.wl1251 => LICENSE.wl1251              |   0
>>>    LICENCE.xc4000 => LICENSE.xc4000              |   0
>>>    LICENCE.xc5000 => LICENSE.xc5000              |   0
>>>    LICENCE.xc5000c => LICENSE.xc5000c            |   2 +-
>>>    Makefile                                      |   6 +-
>>>    README                                        |  43 --
>>>    README.md                                     |  54 +++
>>>    WHENCE                                        | 432 +++++++++---------
>>>    .../hw1.0/notice_ath10k_firmware-5.txt        |  40 +-
>>>    .../hw2.1/notice_ath10k_firmware-5.txt        | 138 +++---
>>>    .../hw3.0/notice_ath10k_firmware-4.txt        | 144 +++---
>>>    .../hw3.0/notice_ath10k_firmware-6.txt        |  32 +-
>>>    .../hw3.0/notice_ath10k_firmware-sdio-6.txt   |  32 +-
>>>    .../hw1.0/notice_ath10k_firmware-5.txt        | 138 +++---
>>>    .../hw1.0/notice_ath10k_firmware-6.txt        |  32 +-
>>>    .../hw1.0/notice_ath10k_firmware-sdio-5.txt   | 138 +++---
>>>    .../hw1.0/notice_ath10k_firmware-5.txt        |   8 +-
>>>    .../hw2.0/notice_ath10k_firmware-5.txt        |  40 +-
>>>    .../hw2.0/notice_ath10k_firmware-4.txt        |   8 +-
>>>    .../hw2.0/notice_ath10k_firmware-5.txt        |   8 +-
>>>    .../hw1.0/notice_ath10k_firmware-5.txt        |  40 +-
>>>    .../hw2.0/notice_ath10k_firmware-5.txt        |  26 +-
>>>    ath10k/WCN3990/hw1.0/notice.txt_wlanmdsp      |  26 +-
>>>    ath11k/IPQ5018/hw1.0/Notice.txt               |  28 +-
>>>    ath11k/IPQ6018/hw1.0/Notice.txt               |  28 +-
>>>    ath11k/IPQ8074/hw2.0/Notice.txt               |  28 +-
>>>    ath11k/QCA6390/hw2.0/Notice.txt               | 100 ++--
>>>    ath11k/QCN9074/hw1.0/Notice.txt               |  28 +-
>>>    ath11k/WCN6750/hw1.0/Notice.txt               | 164 +++----
>>>    ath11k/WCN6855/hw2.0/Notice.txt               |  26 +-
>>>    carl9170fw/carlfw/Kconfig                     |   2 +-
>>>    carl9170fw/carlfw/carl9170.lds                |   4 +-
>>>    carl9170fw/carlfw/include/dma.h               |   2 +-
>>>    carl9170fw/carlfw/src/wlan.c                  |   4 +-
>>>    carl9170fw/carlfw/src/wol.c                   |   2 +-
>>>    carl9170fw/extra/FindGPERF.cmake              |   2 +-
>>>    .../extra/FindPackageHandleStandardArgs.cmake |   8 +-
>>>    carl9170fw/include/shared/fwcmd.h             |   2 +-
>>>    carl9170fw/include/shared/phy.h               |   2 +-
>>>    carl9170fw/tools/carlu/src/fw.c               |   2 +-
>>>    carl9170fw/tools/carlu/src/test.c             |   4 +-
>>>    carl9170fw/tools/carlu/src/usb.c              |   6 +-
>>>    carl9170fw/tools/include/frame.h              |  12 +-
>>>    check_whence.py                               |  89 ++--
>>>    cxgb4/configs/t4-config-default.txt           |   6 +-
>>>    cxgb4/configs/t5-config-default.txt           |   6 +-
>>>    cxgb4/configs/t5-config-hashfilter.txt        |   6 +-
>>>    cxgb4/configs/t6-config-default.txt           |   6 +-
>>>    cxgb4/configs/t6-config-hashfilter.txt        |   8 +-
>>>    dsp56k/concat-bootstrap.pl                    |   2 +-
>>>    keyspan_pda/keyspan_pda.S                     |   4 +-
>>>    keyspan_pda/xircom_pgs.S                      |   4 +-
>>>    qca/NOTICE.txt                                |   6 +-
>>>    qcom/NOTICE.txt                               |  16 +-
>>>    usbdux/usbdux_firmware.asm                    |  16 +-
>>>    usbdux/usbduxfast_firmware.asm                |   6 +-
>>>    usbdux/usbduxsigma_firmware.asm               |  14 +-
>>>    wfx/{LICENCE.wf200 => LICENSE.wf200}          |   0
>>>    111 files changed, 1137 insertions(+), 1043 deletions(-)
>>>    create mode 100644 .codespell.cfg
>>>    create mode 100644 .gitignore
>>>    create mode 100644 .gitlab-ci.yml
>>>    create mode 100644 .pre-commit-config.yaml
>>>    rename LICENCE.Abilis => LICENSE.Abilis (100%)
>>>    rename LICENCE.IntcSST2 => LICENSE.IntcSST2 (100%)
>>>    rename LICENCE.Marvell => LICENSE.Marvell (100%)
>>>    rename LICENCE.NXP => LICENSE.NXP (100%)
>>>    rename LICENCE.Netronome => LICENSE.Netronome (100%)
>>>    rename LICENCE.OLPC => LICENSE.OLPC (100%)
>>>    rename LICENCE.adsp_sst => LICENSE.adsp_sst (99%)
>>>    rename LICENCE.agere => LICENSE.agere (98%)
>>>    rename LICENCE.atheros_firmware => LICENSE.atheros_firmware (100%)
>>>    rename LICENCE.broadcom_bcm43xx => LICENSE.broadcom_bcm43xx (100%)
>>>    rename LICENCE.ca0132 => LICENSE.ca0132 (100%)
>>>    rename LICENCE.cadence => LICENSE.cadence (100%)
>>>    rename LICENCE.cavium => LICENSE.cavium (100%)
>>>    rename LICENCE.cavium_liquidio => LICENSE.cavium_liquidio (97%)
>>>    rename LICENCE.chelsio_firmware => LICENSE.chelsio_firmware (100%)
>>>    rename LICENCE.cnm => LICENSE.cnm (100%)
>>>    rename LICENCE.cw1200 => LICENSE.cw1200 (100%)
>>>    rename LICENCE.cypress => LICENSE.cypress (100%)
>>>    rename LICENCE.e100 => LICENSE.e100 (100%)
>>>    rename LICENCE.ene_firmware => LICENSE.ene_firmware (100%)
>>>    rename LICENCE.fw_sst_0f28 => LICENSE.fw_sst_0f28 (100%)
>>>    rename LICENCE.go7007 => LICENSE.go7007 (100%)
>>>    rename LICENCE.ibt_firmware => LICENSE.ibt_firmware (100%)
>>>    rename LICENCE.it913x => LICENSE.it913x (100%)
>>>    rename LICENCE.iwlwifi_firmware => LICENSE.iwlwifi_firmware (100%)
>>>    rename LICENCE.kaweth => LICENSE.kaweth (97%)
>>>    rename LICENCE.linaro => LICENSE.linaro (100%)
>>>    rename LICENCE.mediatek => LICENSE.mediatek (100%)
>>>    rename LICENCE.microchip => LICENSE.microchip (100%)
>>>    rename LICENCE.moxa => LICENSE.moxa (100%)
>>>    rename LICENCE.myri10ge_firmware => LICENSE.myri10ge_firmware (100%)
>>>    rename LICENCE.nvidia => LICENSE.nvidia (100%)
>>>    rename LICENCE.open-ath9k-htc-firmware => LICENSE.open-ath9k-htc-firmware (100%)
>>>    rename LICENCE.phanfw => LICENSE.phanfw (100%)
>>>    rename LICENCE.qat_firmware => LICENSE.qat_firmware (100%)
>>>    rename LICENCE.qla1280 => LICENSE.qla1280 (100%)
>>>    rename LICENCE.qla2xxx => LICENSE.qla2xxx (100%)
>>>    rename LICENCE.r8a779x_usb3 => LICENSE.r8a779x_usb3 (100%)
>>>    rename LICENCE.ralink-firmware.txt => LICENSE.ralink-firmware.txt (100%)
>>>    rename LICENCE.ralink_a_mediatek_company_firmware => LICENSE.ralink_a_mediatek_company_firmware (100%)
>>>    rename LICENCE.rockchip => LICENSE.rockchip (100%)
>>>    rename LICENCE.rtlwifi_firmware.txt => LICENSE.rtlwifi_firmware.txt (100%)
>>>    rename LICENCE.siano => LICENSE.siano (100%)
>>>    rename LICENCE.ti-connectivity => LICENSE.ti-connectivity (100%)
>>>    rename LICENCE.ti-keystone => LICENSE.ti-keystone (100%)
>>>    rename LICENCE.ti-tspa => LICENSE.ti-tspa (100%)
>>>    rename LICENCE.ueagle-atm4-firmware => LICENSE.ueagle-atm4-firmware (100%)
>>>    rename LICENCE.via_vt6656 => LICENSE.via_vt6656 (100%)
>>>    rename LICENCE.wl1251 => LICENSE.wl1251 (100%)
>>>    rename LICENCE.xc4000 => LICENSE.xc4000 (100%)
>>>    rename LICENCE.xc5000 => LICENSE.xc5000 (100%)
>>>    rename LICENCE.xc5000c => LICENSE.xc5000c (93%)
>>>    delete mode 100644 README
>>>    create mode 100644 README.md
>>>    rename wfx/{LICENCE.wf200 => LICENSE.wf200} (100%)
>>>
>>
>> --
>> With best wishes
>> Dmitry
>>

