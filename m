Return-Path: <SRS0=NClX=GD=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81146C5B569
	for <linux-firmware@archiver.kernel.org>; Mon, 10 Aug 2026 19:00:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 524111F00A3E; Mon, 10 Aug 2026 19:00:01 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.66
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1786388401;
	b=vWuxYI1evNYzw3U/VMBJKqjEQ9yENYPdGoSLq1PwMF/DfqpkFyhOQ5I/DjoMNvB/nyIi
	 Ru2D50TMsE91TRp7EiF+YWkhVfZhJWG2QE4O5M5r2mfulfGHCj8OK0lhcOwG7FR95by9T
	 m3OKc8g9XZyrtQ/WcPP/03kpQq2P7IrrFFKcU3r1lpceg9nMBsvaakQBGi9RnWtjWLzp0
	 +RaFk8xJ+FGbwlsWkp2K6WtQ2Roawh2OnBZGwXKarklOngMv0uiuu3kHxVELspmzVmKbm
	 2v8bqt3Hw/sSDMvXSv0Upo740K3YRqJIW4qtYhCNs7gz0QAPVml4owl/aakIsAEw23Q==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786388401;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:Content-Language:List-Id:To:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=DiMduqn7vrJdh/OzA0mdUzcfRgHp57XabN53j/uCOzc=;
	b=ZjwgcvVs1jFmV+DQ19T0mRlRQ8T1AFql7Ay48O3//E2xsReb56SMZaPd4YQt4kyeJeAJ
	 +ai4xSvzuOLEF2mrugbTn0t/sXcvv0AICrpcnvvS109Ob2OxEdl0vCaocqxfOF1wj/nt5
	 K+zFJom8FWDRhibRbsC0J2WE/pRJpto1IEPHCUbS4k/iuLnuG09SB8O/MJPYI2oa8XyFr
	 4vMWtOqBVZ2jsA9Ho1Hk118jxzwXQ2oLVJv+zjcYNoMt0p3LvnQOJ/HeBzNdnCDlxlb2y
	 5cWPQRTI6NLLbRu/Aw3V5+4VDZbcGbmxUeeD/JIh3/0ODMTL2vWpWDOA8XCqYDAoq4Q==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=OHvJD2AO;
	dmarc=fail header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.66
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010066.outbound.protection.outlook.com [40.93.198.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D5F731F00A3A
	for <linux-firmware@kernel.org>; Mon, 10 Aug 2026 18:59:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=OHvJD2AO
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org D5F731F00A3A
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NlLpqW+XgnENA5+FtP2fBJFiHIvAOEyNxq86BfyFAUZE+k+ZbfXQGmOdQvjD4xKebo/hiCHulE11LfuPDtmcK2xk4xUcX9kc9TcQCZTYWnt98jeWkN+7DtZrhuv15lwsOs3TlhF7t/lyXoDtgB92IJSiLtayI32WWXRLyQQIvhPhrhlGCVV0jBbdafKwf8belBsNpaKhkX5XH9ieYgqKYmAFG7UAVjX0Z4hHK3TtpVTb7oXDynw6ULmZBUMQWiYl0pcE4nql4w0ItsYBb1rJTSQGOwEUSKMeJCvBgXVMZwGQKXRp+f06luhQtLficaZ08+zH/4N/Zj/WW6wPgn2W9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DiMduqn7vrJdh/OzA0mdUzcfRgHp57XabN53j/uCOzc=;
 b=L/a9NTcVsmSyJWAXviutFM9HEpMhTYeJuxm4gbwDjRVtDigCr2vQizxifB1gq3YoTt1BlBIcmgXRaSzJPfITz9ex8gNtYS4vNqG6aqb2h9uODWpdnDuLGYFUwe1nTsft/LJwnlJZ4CIyF7YulDcm/+iiGvK/qapgGwXgPRqsG84HaLOSV7dKykRPJw91HG3VT3lqTIjSrp3Z9SgJy3u2IxRuKVSu/jdLAy7YxqNTgm2T9SyMtg6xm05+iXM4Hb9iwE/ntKB8ceorKjqubFNzgsXaMzeWJf4fg9c3oV/AmTOighNKWn5XLzKdy2Q1TE4GDboTqw7Rx6//G6/smGhGiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DiMduqn7vrJdh/OzA0mdUzcfRgHp57XabN53j/uCOzc=;
 b=OHvJD2AO8tltzmy59s3YWYrH01BZTrUD3cwm7sO4NzuwcSYlqi6bZ1ykMym+Q/RnZSUsXFFUzynIn/pwATRTy3Lrfl1wbuOnYyD9v4zfk/STI7eoyAjkD0BnvyRtR5NxipMW9iYbt/PhEy8ksf3XXmBXfAtiX1gvVkC9rFqDGX4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by MW4PR12MB8611.namprd12.prod.outlook.com (2603:10b6:303:1ed::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Mon, 10 Aug
 2026 18:59:56 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%7]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 18:59:55 +0000
Message-ID: <7980db02-c06b-4040-9661-865025c771b0@amd.com>
Date: Mon, 10 Aug 2026 13:59:53 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [pull] amdgpu firmware updates
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>, linux-firmware@kernel.org
References: <20260810181705.1521852-1-alexander.deucher@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260810181705.1521852-1-alexander.deucher@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR12CA0025.namprd12.prod.outlook.com
 (2603:10b6:610:57::35) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|MW4PR12MB8611:EE_
X-MS-Office365-Filtering-Correlation-Id: c390810b-aca0-4568-17f5-08def711913f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|56012099006|22082099003|10067099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	gdeDDROCwoEuve4J1ZeoEw0JhqTEBplGtfhJQdJSjN6AC03TaErfHzQqm25eyRUojQQ2+QsHRbbY0QNbEhRsDG9k0WTa+S/WMJOwh7hxJGoooOGGup30TDqrLuTUp3HFqcEKjvIY4Vz7GuFzt3VF0lOGx7D9++NofGEv8PKDZ+yEoqre92RsTrD4r3ARZ+AcX+pB7F0qcvPRceLVnipDd32f0DdmTR8Yb8wNoyF5ueLIz4G0Yl1I5adeZ5b/WD+ObWFuby7/0nFNKpPQ9SXFBCAbX1uh6/kIIxeGSEKdkK1vpNdN2Zj0FnA6yEiBYz07P2IsfCJUnJ84U1JYHYMp/Hk7yVbPM+JCj/L16CwOrVn/Doi65iwKQ4WYVBVSJu+2zSak8e7vmHWPs9DVQziW/XWXJbYdr69qFvvLIA9SnnnreCGD7kxfnHfIi55UD1P3QkONwdRtUWYzYVtQCPohcA6TuKpIcL1NTdSGaCBOVllEwrQQ5Be6Wf8U68/LMllzbteV9tPgybd4kmP+cOkOzgw3EImcqCfehplvBOOWV1rlQxanwESfp1znmf0Un97wWh90oobzZR9RvKBuhCU6mXmPERw9x5G3isU3IE9iypK9eB2VYaGOoYHLkbhYrwLdudV91G2Lr9GNFbldoIt8PdH6ymr0qYw04Nh7SFsEHeU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(22082099003)(10067099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0RDQzZXUk1tUUlwdWVlSmwxQTBVOEdERVVwY2M5SHlmN2VpT0pZTUZFbXdw?=
 =?utf-8?B?QUZTOXNVN05vc0wxcXpQWmtlU2dHTDZkaEFmVkZiVWhlbUtNemhoUFRJS2RM?=
 =?utf-8?B?YW51Y3l3R01FZHpWbVM4aGpOYTN6Sjl5Z2UzQ0xiY0RIMnNHbGhGYXZQNTVl?=
 =?utf-8?B?SEUyZzZmTW9HVU1Bd3FKQzFJUnMyQ3hOZW9OSThkdnRzMC9EN3lvUEQ0UXJv?=
 =?utf-8?B?MGkvWmFqaUltZHZka1NJSERWYytqSmR5VXJOWTRKN0llUDIvampvMFJKRWpZ?=
 =?utf-8?B?YTZMUG9kc21Ob2s2U21UQkU3QUxweVNSTWU1SFc2WmNpVFVmbUxWNVRKbFY2?=
 =?utf-8?B?ODB4Z1I3N2lhZGpzck9teDlNU0xiVWFGYnV0VG9HbnF1UzNhcStWWDZMUmVm?=
 =?utf-8?B?Q2VIcDgreTN6VlJpY0ZNS05lL09NK3lubVJ1NmJlSUZwdVU1Nmw4dktXMU1p?=
 =?utf-8?B?NldiUGhKS2JhVUFNTUxrSXBHRVZxOElBSEJzb282aWxuVXFOT3dKWjF4TndP?=
 =?utf-8?B?Vzl2QWVpMzFZMVJaUG8vSmRjTEZGTmIyajUvKzJrOHlIdXczNXIxb1lLQUxS?=
 =?utf-8?B?cjNINWlqYi8rOUpjTWFNbnNLM0wrbTJMaTM1cnZXS1ZtUTY4Nkd5ZjVlRUpo?=
 =?utf-8?B?dy84Z2FreFgwaytESlRLSmYxN0s4Q1U1UTVnbUhQWWRuWTZUUmF0WG1mOWpR?=
 =?utf-8?B?KzUwMVVJVytvV1VWV1MyYTZUUmpvYlRZWFpLVGk2YjR6bnFyRDlGSnlhbE9w?=
 =?utf-8?B?WGphQ3FvQVRxcGZuOFNvZllxaWpBeGlhR2dnRGFZTWlBMXd2dWlsZWpVT3lq?=
 =?utf-8?B?bWRYRjN2NVExd0tYZWRvRmU2akdCOWQySThSYi8rL01id1p1bWZ0TEdqZkZY?=
 =?utf-8?B?bDJzOU1mcjdVQTluaDJ2eUVkV1hna2ZtYUlKeVZRV09PTmpyZjNhV1Evd1Rx?=
 =?utf-8?B?Q2VvM1ZQOWVvUzV3V29iVXZWV2NWSU1qSiszK0plVDNEL1NndnZmZitFSU1Y?=
 =?utf-8?B?UXpmMHhQeUl5UFNkbU5YOXpscGhsRC9STlNCbzgxZ2FVTW80amJEaHRYdlZD?=
 =?utf-8?B?WHJoVzBHQmRoQW9yaExhVm1GT2VybC8vOGx5bEdxZlBkemFTK2ZYd29hY1pL?=
 =?utf-8?B?bkJWcC9EeURublo4SmxQOFBaRktaSENlM1VBaWZ6SGNSdkpmTFNlRzVpSlNO?=
 =?utf-8?B?a05JTnFtVkZvaVl6djN6SHhVM0pPQjhXMTdETDBnRDQvbXdpemwwbmFDaDFn?=
 =?utf-8?B?dVdadTRKMFkzV25XcFVpNWZuMzdhcG14Q0ZFOURJVTYzYlF3N0NncGVxRFVp?=
 =?utf-8?B?b2tCcGdoUGpwWWpQb0JFWUFob1EvMlZwSzdvOTVjOUJzbmt6M25aTlNjcnRo?=
 =?utf-8?B?dDlub01VbUpKYzZ6SmlzT1VZVVdKK0toZUtReHIvcGJuMFNrQ0lRZ2E5MVhV?=
 =?utf-8?B?N2kyYW5XTHZOL2Y1N2tyMEs1Z3dBblRzZHNySjI4Z3lKdTduQ0RGbndFSEww?=
 =?utf-8?B?dlFRaVQvekFhMTdOT09SWGo5ekRYM3QyNGh5Zkh4K3ZwVzZ3YzY4bndPNXo2?=
 =?utf-8?B?ckk0dnV6cnVVRFIvUWEvR2YvSnRBZ1B1RU5TelBuUGNESkRJN3ZXUmNrditj?=
 =?utf-8?B?dys1Zm52NVZZUVNnY3N6bDJmZVlWS21INlgzOGJha2pQYXpiUDVQR1dQcHFq?=
 =?utf-8?B?L28xUnRzd2JQaTBoMnl5MlpiT1NvbFNWd2JlSzBRZ0ptMEZoN2ZEZndoREtS?=
 =?utf-8?B?d09udHBMYVFEUStnMlJlaFI0RzV3K1RkVUJaeUhFdjJEWVZIVGs0akEwWU1Z?=
 =?utf-8?B?M3Vsa0xwUkpaZDNQclF0VFJxOVE0R0hUSkNYc3hwUmxQV0FHS083dyt4V2pW?=
 =?utf-8?B?V2twdnZ1TWlHUGhrKytNNDdNRnRpcU9PVlI3aWh5cmx6Q0kyVW95MWlQc0xE?=
 =?utf-8?B?akh4RHQ5V2JiKzdtNkNhR1BqRllFbFcxUXlmQ3M1ZERsandvOFdLM3FxdjdU?=
 =?utf-8?B?ZTF6OFpOUHQ3MnNtNEdDdFpoaTcwdWUzZzl5LzlNRUJPWVlsL2FiWmdBNUty?=
 =?utf-8?B?OWs0VVNqQXlTNU9MUFcvSFRwOHNTMFdXYzVGV2ZoSnh3bXBCbDFaSW8xTXZm?=
 =?utf-8?B?OTc2SUJ4TUo5NWRXSFlYUi81Z3o4ZTA0bFdLNThQL3pIYVFvREIzWExlMUNt?=
 =?utf-8?B?U25jcldlSXY4MDdPWlM0b1J6SnlHMzF5RHZyYmNKZ1VEajA0SXdydVdQeUVR?=
 =?utf-8?B?RmFTZ25RSE5CRWQ3bVdWNWk2SzMxNUFqWkcxNitOU1hBbUhITUxjZVhVR1VM?=
 =?utf-8?Q?/CKeWER6rnDSODJfhm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c390810b-aca0-4568-17f5-08def711913f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 18:59:55.7743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GbrJHV8fsF0xExO3AUGaT1CzkTQq+asyCtZjBwCtqn9vL9RpRRc66zOwrTPRWFQDo1+p32ZJCp0/P09uhrY0Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB8611



On 8/10/26 13:17, Alex Deucher wrote:
> Hi,
> 
> Updated amdgpu firmwares.
> 
> The following changes since commit 495465e0e7742d29f52674ff3172445a8f03a3a7:
> 
>    amdgpu: DMCUB updates for various ASICs (2026-07-27 14:58:13 +0000)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/kernel-firmware/drm-firmware.git tags/amd-2026-08-10
> 
> for you to fetch changes up to b22a326c596b4b53abe3df6cdc937e679c023213:
> 
>    amdgpu: update vangogh firmware (2026-08-03 18:09:06 -0400)
> 
> ----------------------------------------------------------------
> Update amdgpu firmwares
> 
> ----------------------------------------------------------------
> Alex Deucher (65):
>        amdgpu: update aldebaran firmware
>        amdgpu: update GC 9.4.3 firmware
>        amdgpu: update PSP 13.0.6 firmware
>        amdgpu: update VCN 4.0.3 firmware
>        amdgpu: update arcturus firmware
>        amdgpu: update green sardine firmware
>        amdgpu: update GC 11.5.2 firmware
>        amdgpu: update PSP 14.0.4 firmware
>        amdgpu: update VPE 6.1.3 firmware
>        amdgpu: update GC 11.5.3 firmware
>        amdgpu: update PSP 14.0.5 firmware
>        amdgpu: update GC 9.4.4 firmware
>        amdgpu: update PSP 13.0.14 firmware
>        amdgpu: update GC 9.5.0 firmware
>        amdgpu: update PSP 13.0.12 firmware
>        amdgpu: update VCN 5.0.1 firmware
>        amdgpu: add PSP 13.0.15 firmware
>        amdgpu: update navi10 firmware
>        amdgpu: update navi12 firmware
>        amdgpu: update navi14 firmware
>        amdgpu: update sienna cichlid firmware
>        amdgpu: update navy flounder firmware
>        amdgpu: update dimgrey cavefish firmware
>        amdgpu: update beige goby firmware
>        amdgpu: update GC 11.0.0 firmware
>        amdgpu: update PSP 13.0.0 firmware
>        amdgpu: update SMU 13.0.0 firmware
>        amdgpu: update VCN 4.0.0 firmware
>        amdgpu: update GC 11.0.3 firmware
>        amdgpu: update PSP 13.0.10 firmware
>        amdgpu: update SDMA 6.0.3 firmware
>        amdgpu: update SMU 13.0.10 firmware
>        amdgpu: update GC 11.0.2 firmware
>        amdgpu: update PSP 13.0.7 firmware
>        amdgpu: update SMU 13.0.7 firmware
>        amdgpu: update vcn 4.0.4 firmware
>        amdgpu: update GC 12.0.0 firmware
>        amdgpu: update PSP 14.0.2 firmware
>        amdgpu: update SMU 14.0.2 firmware
>        amdgpu: update GC 12.0.1 firmware
>        amdgpu: update PSP 14.0.3 firmware
>        amdgpu: update SMU 14.0.3 firmware
>        amdgpu: update VCN 5.0.0 firmware
>        amdgpu: update GC 11.0.1 firmware
>        amdgpu: update PSP 13.0.4 firmware
>        amdgpu: update VCN 4.0.2 firmware
>        amdgpu: update GC 11.0.4 firmware
>        amdgpu: update PSP 13.0.11 firmware
>        amdgpu: update picasso firmware
>        amdgpu: update GC 10.3.6 firmware
>        amdgpu: update PSP 13.0.5 firmware
>        amdgpu: update VCN 3.1.2 firmware
>        amdgpu: update raven firmware
>        amdgpu: update raven2 firmware
>        amdgpu: update yellow carp firmware
>        amdgpu: update renoir firmware
>        amdgpu: update GC 11.5.0 firmware
>        amdgpu: update PSP 14.0.0 firmware
>        amdgpu: update VCN 4.0.5 firmware
>        amdgpu: update VPE 6.1.0 firmware
>        amdgpu: update GC 11.5.1 firmware
>        amdgpu: update PSP 14.0.1 firmware
>        amdgpu: update VCN 4.0.6 firmware
>        amdgpu: update VPE 6.1.1 firmware
>        amdgpu: update vangogh firmware
> 
>   WHENCE                           |   2 ++
>   amdgpu/aldebaran_sdma.bin        | Bin 34304 -> 34304 bytes
>   amdgpu/aldebaran_vcn.bin         | Bin 422656 -> 423936 bytes
>   amdgpu/arcturus_vcn.bin          | Bin 420736 -> 423936 bytes
>   amdgpu/beige_goby_sdma.bin       | Bin 34048 -> 34048 bytes
>   amdgpu/beige_goby_ta.bin         | Bin 259328 -> 259328 bytes
>   amdgpu/beige_goby_vcn.bin        | Bin 580112 -> 582160 bytes
>   amdgpu/dimgrey_cavefish_sdma.bin | Bin 34048 -> 34048 bytes
>   amdgpu/dimgrey_cavefish_ta.bin   | Bin 259328 -> 259328 bytes
>   amdgpu/dimgrey_cavefish_vcn.bin  | Bin 580112 -> 582160 bytes
>   amdgpu/gc_10_3_6_rlc.bin         | Bin 177104 -> 177104 bytes
>   amdgpu/gc_11_0_0_me.bin          | Bin 315120 -> 324064 bytes
>   amdgpu/gc_11_0_0_mec.bin         | Bin 406528 -> 406528 bytes
>   amdgpu/gc_11_0_0_mes1.bin        | Bin 220480 -> 221120 bytes
>   amdgpu/gc_11_0_0_mes_2.bin       | Bin 260624 -> 263664 bytes
>   amdgpu/gc_11_0_0_pfp.bin         | Bin 232096 -> 234960 bytes
>   amdgpu/gc_11_0_1_mes1.bin        | Bin 235312 -> 235600 bytes
>   amdgpu/gc_11_0_1_mes_2.bin       | Bin 263616 -> 263664 bytes
>   amdgpu/gc_11_0_1_rlc.bin         | Bin 157040 -> 157040 bytes
>   amdgpu/gc_11_0_2_me.bin          | Bin 315120 -> 324080 bytes
>   amdgpu/gc_11_0_2_mec.bin         | Bin 406528 -> 406528 bytes
>   amdgpu/gc_11_0_2_mes1.bin        | Bin 218560 -> 221408 bytes
>   amdgpu/gc_11_0_2_mes_2.bin       | Bin 260624 -> 263664 bytes
>   amdgpu/gc_11_0_2_pfp.bin         | Bin 232112 -> 234944 bytes
>   amdgpu/gc_11_0_3_me.bin          | Bin 315136 -> 324080 bytes
>   amdgpu/gc_11_0_3_mec.bin         | Bin 406528 -> 406528 bytes
>   amdgpu/gc_11_0_3_mes1.bin        | Bin 220544 -> 221216 bytes
>   amdgpu/gc_11_0_3_mes_2.bin       | Bin 260688 -> 263728 bytes
>   amdgpu/gc_11_0_3_pfp.bin         | Bin 232112 -> 234944 bytes
>   amdgpu/gc_11_0_4_me.bin          | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_0_4_mec.bin         | Bin 268160 -> 268160 bytes
>   amdgpu/gc_11_0_4_mes1.bin        | Bin 234640 -> 234928 bytes
>   amdgpu/gc_11_0_4_mes_2.bin       | Bin 257760 -> 263664 bytes
>   amdgpu/gc_11_0_4_pfp.bin         | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_5_0_me.bin          | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_5_0_mec.bin         | Bin 268160 -> 268160 bytes
>   amdgpu/gc_11_5_0_mes1.bin        | Bin 238128 -> 238560 bytes
>   amdgpu/gc_11_5_0_mes_2.bin       | Bin 258208 -> 263632 bytes
>   amdgpu/gc_11_5_0_pfp.bin         | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_5_1_me.bin          | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_5_1_mec.bin         | Bin 268160 -> 268160 bytes
>   amdgpu/gc_11_5_1_mes1.bin        | Bin 238320 -> 238720 bytes
>   amdgpu/gc_11_5_1_mes_2.bin       | Bin 258496 -> 263920 bytes
>   amdgpu/gc_11_5_1_pfp.bin         | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_5_2_me.bin          | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_5_2_mec.bin         | Bin 268160 -> 268160 bytes
>   amdgpu/gc_11_5_2_mes1.bin        | Bin 237776 -> 238176 bytes
>   amdgpu/gc_11_5_2_mes_2.bin       | Bin 260560 -> 263632 bytes
>   amdgpu/gc_11_5_2_pfp.bin         | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_5_3_me.bin          | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_5_3_mec.bin         | Bin 268160 -> 268160 bytes
>   amdgpu/gc_11_5_3_mes1.bin        | Bin 237776 -> 238176 bytes
>   amdgpu/gc_11_5_3_mes_2.bin       | Bin 260560 -> 263632 bytes
>   amdgpu/gc_11_5_3_pfp.bin         | Bin 263424 -> 263424 bytes
>   amdgpu/gc_12_0_0_me.bin          | Bin 459840 -> 463392 bytes
>   amdgpu/gc_12_0_0_mec.bin         | Bin 455648 -> 455648 bytes
>   amdgpu/gc_12_0_0_pfp.bin         | Bin 353536 -> 354912 bytes
>   amdgpu/gc_12_0_0_uni_mes.bin     | Bin 727680 -> 734336 bytes
>   amdgpu/gc_12_0_1_me.bin          | Bin 459840 -> 463392 bytes
>   amdgpu/gc_12_0_1_mec.bin         | Bin 455648 -> 451552 bytes
>   amdgpu/gc_12_0_1_pfp.bin         | Bin 353536 -> 354912 bytes
>   amdgpu/gc_12_0_1_uni_mes.bin     | Bin 727680 -> 734336 bytes
>   amdgpu/gc_9_4_3_mec.bin          | Bin 268736 -> 268736 bytes
>   amdgpu/gc_9_4_3_sjt_mec.bin      | Bin 268736 -> 268736 bytes
>   amdgpu/gc_9_4_4_mec.bin          | Bin 268736 -> 268736 bytes
>   amdgpu/gc_9_4_4_sjt_mec.bin      | Bin 268736 -> 268736 bytes
>   amdgpu/gc_9_5_0_mec.bin          | Bin 268736 -> 268736 bytes
>   amdgpu/gc_9_5_0_sjt_mec.bin      | Bin 268736 -> 268736 bytes
>   amdgpu/green_sardine_asd.bin     | Bin 209408 -> 209408 bytes
>   amdgpu/green_sardine_ta.bin      | Bin 37632 -> 37632 bytes
>   amdgpu/green_sardine_vcn.bin     | Bin 404544 -> 405952 bytes
>   amdgpu/navi10_asd.bin            | Bin 209408 -> 209408 bytes
>   amdgpu/navi10_sdma.bin           | Bin 33792 -> 33792 bytes
>   amdgpu/navi10_sdma1.bin          | Bin 33792 -> 33792 bytes
>   amdgpu/navi10_ta.bin             | Bin 37632 -> 37632 bytes
>   amdgpu/navi10_vcn.bin            | Bin 404544 -> 405952 bytes
>   amdgpu/navi12_asd.bin            | Bin 209408 -> 209408 bytes
>   amdgpu/navi12_sdma.bin           | Bin 33792 -> 33792 bytes
>   amdgpu/navi12_sdma1.bin          | Bin 33792 -> 33792 bytes
>   amdgpu/navi12_ta.bin             | Bin 37632 -> 37632 bytes
>   amdgpu/navi12_vcn.bin            | Bin 404544 -> 405952 bytes
>   amdgpu/navi14_asd.bin            | Bin 209408 -> 209408 bytes
>   amdgpu/navi14_ce_wks.bin         | Bin 263296 -> 263296 bytes
>   amdgpu/navi14_me_wks.bin         | Bin 263424 -> 263424 bytes
>   amdgpu/navi14_mec2_wks.bin       | Bin 268160 -> 268160 bytes
>   amdgpu/navi14_mec_wks.bin        | Bin 268160 -> 268160 bytes
>   amdgpu/navi14_pfp_wks.bin        | Bin 263424 -> 263424 bytes
>   amdgpu/navi14_sdma.bin           | Bin 33792 -> 33792 bytes
>   amdgpu/navi14_sdma1.bin          | Bin 33792 -> 33792 bytes
>   amdgpu/navi14_ta.bin             | Bin 37632 -> 37632 bytes
>   amdgpu/navi14_vcn.bin            | Bin 404544 -> 405952 bytes
>   amdgpu/navy_flounder_sdma.bin    | Bin 34048 -> 34048 bytes
>   amdgpu/navy_flounder_ta.bin      | Bin 259328 -> 259328 bytes
>   amdgpu/navy_flounder_vcn.bin     | Bin 580112 -> 582160 bytes
>   amdgpu/picasso_vcn.bin           | Bin 366560 -> 369408 bytes
>   amdgpu/psp_13_0_0_sos.bin        | Bin 268304 -> 272400 bytes
>   amdgpu/psp_13_0_0_sos_kicker.bin | Bin 268976 -> 273072 bytes
>   amdgpu/psp_13_0_0_ta.bin         | Bin 271616 -> 271616 bytes
>   amdgpu/psp_13_0_0_ta_kicker.bin  | Bin 259328 -> 259328 bytes
>   amdgpu/psp_13_0_10_ta.bin        | Bin 267712 -> 267712 bytes
>   amdgpu/psp_13_0_11_ta.bin        | Bin 254976 -> 254976 bytes
>   amdgpu/psp_13_0_12_sos.bin       | Bin 455472 -> 455472 bytes
>   amdgpu/psp_13_0_14_sos.bin       | Bin 405824 -> 405824 bytes
>   amdgpu/psp_13_0_15_sos.bin       | Bin 0 -> 439088 bytes
>   amdgpu/psp_13_0_15_ta.bin        | Bin 0 -> 49920 bytes
>   amdgpu/psp_13_0_4_ta.bin         | Bin 254976 -> 254976 bytes
>   amdgpu/psp_13_0_5_asd.bin        | Bin 209408 -> 209408 bytes
>   amdgpu/psp_13_0_5_ta.bin         | Bin 246784 -> 246784 bytes
>   amdgpu/psp_13_0_6_sos.bin        | Bin 787040 -> 787040 bytes
>   amdgpu/psp_13_0_7_ta.bin         | Bin 246784 -> 246784 bytes
>   amdgpu/psp_14_0_0_ta.bin         | Bin 254976 -> 254976 bytes
>   amdgpu/psp_14_0_1_ta.bin         | Bin 254976 -> 254976 bytes
>   amdgpu/psp_14_0_2_ta.bin         | Bin 274432 -> 278508 bytes
>   amdgpu/psp_14_0_3_sos.bin        | Bin 435632 -> 435632 bytes
>   amdgpu/psp_14_0_3_sos_kicker.bin | Bin 435968 -> 435968 bytes
>   amdgpu/psp_14_0_3_ta.bin         | Bin 287040 -> 291116 bytes
>   amdgpu/psp_14_0_4_ta.bin         | Bin 254976 -> 254976 bytes
>   amdgpu/psp_14_0_5_ta.bin         | Bin 254976 -> 254976 bytes
>   amdgpu/raven2_vcn.bin            | Bin 366560 -> 369408 bytes
>   amdgpu/raven_vcn.bin             | Bin 366560 -> 369408 bytes
>   amdgpu/renoir_asd.bin            | Bin 209408 -> 209408 bytes
>   amdgpu/renoir_ta.bin             | Bin 46080 -> 46080 bytes
>   amdgpu/renoir_vcn.bin            | Bin 404544 -> 405952 bytes
>   amdgpu/sdma_6_0_3.bin            | Bin 34560 -> 34560 bytes
>   amdgpu/sienna_cichlid_sdma.bin   | Bin 34048 -> 34048 bytes
>   amdgpu/sienna_cichlid_ta.bin     | Bin 386816 -> 386816 bytes
>   amdgpu/sienna_cichlid_vcn.bin    | Bin 580112 -> 582160 bytes
>   amdgpu/smu_13_0_0.bin            | Bin 292452 -> 292452 bytes
>   amdgpu/smu_13_0_0_kicker.bin     | Bin 261888 -> 261888 bytes
>   amdgpu/smu_13_0_10.bin           | Bin 271520 -> 271520 bytes
>   amdgpu/smu_13_0_7.bin            | Bin 287080 -> 287080 bytes
>   amdgpu/smu_14_0_2.bin            | Bin 333236 -> 333236 bytes
>   amdgpu/smu_14_0_3.bin            | Bin 333236 -> 333236 bytes
>   amdgpu/smu_14_0_3_kicker.bin     | Bin 327424 -> 327424 bytes
>   amdgpu/vangogh_asd.bin           | Bin 209408 -> 209408 bytes
>   amdgpu/vangogh_vcn.bin           | Bin 572368 -> 574288 bytes
>   amdgpu/vcn_3_1_2.bin             | Bin 572496 -> 574288 bytes
>   amdgpu/vcn_4_0_0.bin             | Bin 395664 -> 403856 bytes
>   amdgpu/vcn_4_0_2.bin             | Bin 395664 -> 403856 bytes
>   amdgpu/vcn_4_0_3.bin             | Bin 359696 -> 359824 bytes
>   amdgpu/vcn_4_0_4.bin             | Bin 395664 -> 403856 bytes
>   amdgpu/vcn_4_0_5.bin             | Bin 395664 -> 403856 bytes
>   amdgpu/vcn_4_0_6.bin             | Bin 395664 -> 403856 bytes
>   amdgpu/vcn_4_0_6_1.bin           | Bin 395664 -> 403856 bytes
>   amdgpu/vcn_5_0_0.bin             | Bin 438288 -> 439824 bytes
>   amdgpu/vcn_5_0_1.bin             | Bin 217680 -> 218896 bytes
>   amdgpu/vpe_6_1_0.bin             | Bin 25984 -> 25984 bytes
>   amdgpu/vpe_6_1_1.bin             | Bin 25984 -> 25984 bytes
>   amdgpu/vpe_6_1_3.bin             | Bin 25984 -> 25984 bytes
>   amdgpu/yellow_carp_ta.bin        | Bin 246784 -> 246784 bytes
>   amdgpu/yellow_carp_vcn.bin       | Bin 572368 -> 574288 bytes
>   151 files changed, 2 insertions(+)
>   create mode 100644 amdgpu/psp_13_0_15_sos.bin
>   create mode 100644 amdgpu/psp_13_0_15_ta.bin

Merged, thanks.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1173
