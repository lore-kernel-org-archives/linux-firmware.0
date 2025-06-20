Return-Path: <SRS0=N0fI=ZD=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02741C7115C
	for <linux-firmware@archiver.kernel.org>; Fri, 20 Jun 2025 19:36:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D4454C4CEED; Fri, 20 Jun 2025 19:36:27 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 46A2BC4CEE3
	for <linux-firmware@kernel.org>; Fri, 20 Jun 2025 19:36:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 46A2BC4CEE3
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x/uV/83ianN/KXUajc2aHtHt+MFRz3V+oh8RfAIC/1yeuWIa3sgUsotJnVxK6MTimtodLX7zPTm4r+UvF7fhky/jCvYDiW7OOcpqS71h3jOZGmYfGuffhJlSB3tlW88Zw/fSmzz+t1GH6v6ef2Sm72EZwOCxQKrDc+LxpSadLJyXRBVRooDQK0NVrHEYdDGc+cZwbU0y9r1U+vMKgzSmxILBflxUXahT7KA0J8sPbiH9CneH+ERLKhWjfyxxclk3NIbVoUzjR2gXyUi0rQbADGylRofpwS1D2UFEe6/CSniTY2g/HKh85ZaFAmJMZ62Qao2PaLokJOXnx6JHVfS3UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F3aoPjQpbMis0iCcY32SWvUWRhlbkLa96TeAZU/5coo=;
 b=BEP2Z8cZQIX+wFPK9+Xi5fhe/y/6saxgOYit+z1ggbYvHyN1TpVoSh3eG5gszoeh06Q9wXIZTQvYUsRDFZgi1aARlhPc++NCXyLdyZZUnPg8WcmzIzo8tQKJUJEstNP/9IpmYXCZJVaifJl/U2eHmjhJypyQF+rttKNQK6fC34o4WDXIw409Hv4rPTeenbpR0DlsNzHuo/dOW8XTGquB6Fmk5tMwQ2+jmrtXDIrwLhZb6VyZaDF/jOgSC+mcz53f52uHqJe+KVOZ667NUbYya16noawFpMQkNmYYHsnhNh2hfXgWug/287wwOhcGhg7wgb5wep71dJkHtIvI1tYMkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3aoPjQpbMis0iCcY32SWvUWRhlbkLa96TeAZU/5coo=;
 b=VSYlQywdeg/LBVPvw/gjnXzRsugSoMqB4E4wKMjOfnD1XP7pPN61YIVTNnP8xbmWeK2JoAO8BsE6RF9dWYMShazz0EAwiqsSYPMYfoZ89G5i6keqJnbTN+30rQRDo2wfV9FodUR2q7X7iEGQ+owloJPevWs9g9TVoUZkC+Vmrdg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MN2PR12MB4128.namprd12.prod.outlook.com (2603:10b6:208:1dd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Fri, 20 Jun
 2025 19:36:24 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.8857.019; Fri, 20 Jun 2025
 19:36:23 +0000
Message-ID: <e8cf7c72-65e6-454e-b72c-0149f6c480b3@amd.com>
Date: Fri, 20 Jun 2025 14:36:21 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [pull] amdgpu firmware amd-2025-06-20
List-Id: <linux-firmware.lore.kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>, linux-firmware@kernel.org
References: <20250620172656.55698-1-alexander.deucher@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250620172656.55698-1-alexander.deucher@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0165.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::22) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MN2PR12MB4128:EE_
X-MS-Office365-Filtering-Correlation-Id: fba7f327-c94b-4a21-1dee-08ddb031bd6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZjN0RFMwWFN2TzBhNy9BVkRLRkx1SkhRS3BiT2ZRZ1ViWVljODNSQ0EwZWdC?=
 =?utf-8?B?eUE3S0tOUTM0cS8zVkJtU25BbVMxK2YzUWMrcU4xdDNFcjlGV2VUUmZkU1JV?=
 =?utf-8?B?Yy8wdkVTamNrNDQrZ3V1VTZFQVFINUNyTzY4VUdzaXdsSkFWMkJkdHgzUTlQ?=
 =?utf-8?B?VEs5V3luaTAzNVJYMG4rTDI2VENSbmo3MUJRQ3gwSnRJQ2F0dWpSclVUYUZ5?=
 =?utf-8?B?SmhkRHZhK1NFL2UzRmxaRkdwd2dKVFhBTnVEY2FnQzd3WnpxS1JzZ2dXUytk?=
 =?utf-8?B?WEJsNG5XNHgxTnFueFd2ZkJHTkQyV3B4dnJ4ZFdHM1E2T25rR1NYUjJRLzN2?=
 =?utf-8?B?QWcreTRraEx4eFR4YW05eGV1Sy9VelBCNG52WitSOFZvTFpwZXkreTBJNW0r?=
 =?utf-8?B?M0hIVVMrRHRHSmV5QVNTbHI5TkFZZ3RjY0tBajZBVjVPalVWZGtjYklubGt1?=
 =?utf-8?B?aG9NZHV1N1NqQytUSkczelMxNW1lYUN5VTN2UUtUaGd6VXI4ZlpIUnpwbjBi?=
 =?utf-8?B?ZWtubC81QmJ6RWFYSzh0eWk5WEdlaWx5VWtVQnhvYlIrcjEvUjEwcXVYQjMw?=
 =?utf-8?B?N1VHdVBmNGc5QW1lQ2V4RmZ2RHJMdHU5MVZBc2MwMlFQU2c3RUVzWStxRG9C?=
 =?utf-8?B?c2ZzUnd1SG9QYjBPRElNWlp3T1lHejd1U3ZFRWZrNUZqV0FqQ0U1R3hvQ2Ir?=
 =?utf-8?B?Qkd3VjhsKzFvRnZHZURaamhnSWczb1dGOGc4QnA2N3lyVFFNYTJFekVNVEZx?=
 =?utf-8?B?M1EyT0V5Ynp4aVhHcVR0dmNQQnhsaVp4NERCNjFqV3VMa3gvNEdGcnVMUHlP?=
 =?utf-8?B?bEk2Y20rNm5ST1g0MXE3TDM1RW9yNVlwR3Bjci9TU1EvZXpmV1lrUDZWVWQ1?=
 =?utf-8?B?UEprVWJlajEzNXZmMkJSVVBEMDBYbHQ3ekJKcnA4MTRJSHZyWWRGaFBsb052?=
 =?utf-8?B?Mnp0TmFKYWQrbjYrUzlodDFLL2tvc1ZVR3hpQnp3Vk04TEl6OGRvMGtram1M?=
 =?utf-8?B?L1F6RE5mZHRRbk5LbHh6cDFzYnJ6ZTdoT0NVQit1TFllRVVtWXlhcEo4cDRB?=
 =?utf-8?B?ckczSlE0eWI5b3NrakJNcmxhdjlwR0lYa2t4Y1puWit6YkNFN08wTlkxU1Bm?=
 =?utf-8?B?TVhWQ2ora1hNMytSNFFOOE1KYUV5dmhkZndoZjdHYTBBeUhZK1prR0pCeVdB?=
 =?utf-8?B?Z0k2MmVjcksrenFjWDRrWHF1TWRTb2Z5WGlOcUpnYzZQSC9BRDVYRmFoR2xG?=
 =?utf-8?B?OGZzSUMzb0hRaWcwL2FrU3FSb2RLU2h4eGdzRkhTb3A3ZHZaYVpENVFoZEFX?=
 =?utf-8?B?MjErUFFDdGRubTlxRHRtTytzV2FBeFdkS0kxQ0Q5T1ZvcVJ0eVhJbVZTMkdD?=
 =?utf-8?B?V0x6VVNmVDI5UjhHdlpYeVgzRHpYWnZmeWw1bmRVSFgweXFqKzhyamRuc0lE?=
 =?utf-8?B?WHNPTXVRWCt4VlpCV2tuWHVvdmlsQVNCWkdUTkVFYStqS0wvdmhVenh3ZWU0?=
 =?utf-8?B?YWZlaGVrdkEzWTFJMEJieDdzcWx6UHI5cXR2b1VEb3hUWGpoUzUrSmxOamo4?=
 =?utf-8?B?NU9iaEYraE42VXczRFl6eXZLQkxFUWpCMGdsNHBreVZpMlNIRXl2Qm02M1k5?=
 =?utf-8?B?LzBIQUljdWdVZzFpTWxFbXdCS1o1ZXN4OWdlTjlhbVB3ZE9ZZEVXb3JvUTcw?=
 =?utf-8?B?eUVvUmVoZ3phMlhVVXBab1pab21SWXNjU3pxMkFUK2MrTlY3U01pZVRBTVZL?=
 =?utf-8?B?eTVnVVlybWwrTTE0YnNUc2tPUVhqUWdrMTZ1SGpZclg1M2UycTNGbHRxcy9L?=
 =?utf-8?B?ODJjRHJ0d3FjNVQzelpqT3h4S3VRYUVSODlaME1WdnFscitBelc4M0lUM3Zr?=
 =?utf-8?B?eXBzc2p4SXRWMnBWT2cxM0lWRVZZYnBTTmtDSFREN3Iwbkl2MW45UTh0dDNu?=
 =?utf-8?Q?fbgu4IJizbk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkZjU2MxZGErelEvdHFXQlBJbEhSSFh2eGhkcmFpc0Q3eEJFOEZpNG1XUXhF?=
 =?utf-8?B?b3U0VUtjKytoYzFLbWZpdUpRK0s1VHpDNW9VNlJVUi8xYmllZHJsWHF1QTVy?=
 =?utf-8?B?UDl1VlRiK3k5T1Q4T0NVbFYzRUZRcENoTE9sc1lIZ3dhdnhtZjVMQVQxS3dL?=
 =?utf-8?B?NWk1SGh4NlpBYjlDMU1UYXJyVDl2M1RLUWJ5S0M1aXJaa0hRTWJqZThXVUsw?=
 =?utf-8?B?eDR1WU9pTDlYMFoyWXdQalJiMEIyMDloQzhXSHNuWHJYR0VoRUtGQVpuV1A0?=
 =?utf-8?B?L2hwdzFodENkRUNVR2tZOEhiWGQyQU41RXVMNkxHSUFFL2VxcXc1K0pZcDZ2?=
 =?utf-8?B?dWF0UnN5V3R5SWJnc1N2NkRjNWloVHVLMytrT0dWVWQ1NjhIQ3dIN2Uwc0hO?=
 =?utf-8?B?RzRHaVBQK1hKT01MVTUvUkRuZXNIYkhEM3ErNTArOTFnUEkwTC84ZDVmSDRP?=
 =?utf-8?B?M2t0MGdTUjhoRXVEUHZMNE14RlUwZ21jU3pBK2JjcnFpM3A5OGFiWW5Yc3VO?=
 =?utf-8?B?RytiZzdpTldLMS9TZkJJV1k2QkQ1MXdpUzlVSzhaelhLWFQvaVRXWnp4dnN0?=
 =?utf-8?B?ekdHM01KTDV2OU9qSm96cDJ0Q05sdVFxZjFZUXJjTVFwblVVWDdGTWJQb2xD?=
 =?utf-8?B?SFY4aHpVSzRxMXJ0M2daTlRBU2t0ZVJ6WmV6ODFDbkFTOHJXSXYyb2tYMDFp?=
 =?utf-8?B?ajdCU1dyUEZ3aDc4Sjl3YXEzRDFPeWlKS3VBUEdzQUFWVG56aDFDNHd0YUZs?=
 =?utf-8?B?UnpTU2tQeGJXNVl0aFNKMTB6K2RZeDBvMTBCcENhSXFWNXQ5MmpJVGs2RUd0?=
 =?utf-8?B?Z3RlNDI2cFY1bHNWekRLelo5enh1SGMyVGNxZFNqMURLbmNad2tjRHVjemN3?=
 =?utf-8?B?MHVSWnVPMG90cFQvYXBDQ204cWdzWGlpTVpWclg5WXNhajNFSlZkbFkzQldr?=
 =?utf-8?B?UTFGRUo2bElnQlR0U3l0bmJHZTB4bzNXa1d3QmdtUEpHbXlGK2RlYkZRNFU3?=
 =?utf-8?B?c3RFMEZ5UEkydEtXeThkd2szdy9PTldKTS9JL3RnTzF6dVdPQXdOSndnNXZ6?=
 =?utf-8?B?L3VGWWhQUndTMEwwcmc4NTJaMzlUTk9JVHFXWVI4a0dtbTcwNU4yOVZSbFhI?=
 =?utf-8?B?TVh1eTg5dFhwMVd1VjNDTUwxZ0pIZWliM2ZxTmNsVURaQi9vM1RkemZlZHps?=
 =?utf-8?B?K2JEQlYxSjRjUXFYNTIxK2NkeUkxd2oxUWdLc0MybzA5SmpUbEpOV3pJM3NR?=
 =?utf-8?B?M1BYdS95N2poZTl2bms3c0VvSU12OVplSCtyZXZrUG9rM05SNmVRMVVaeHh6?=
 =?utf-8?B?QysyWmhRaHNjTHM5OGFMS1F4Qnp0U0JlWndOOERPcThjUmdxRnI1aVRGS3NF?=
 =?utf-8?B?Mk5EaUsycm5nMkJLL0pzRDc4dHcvcGg5ZzJKRENHTXRrVlRRREx0dERxYXJa?=
 =?utf-8?B?VzMyMzAwVUxJaVZqYWFweEowd3puTzhzSVBQall5bDBjTTBwaWpIeUJSMit3?=
 =?utf-8?B?dHdqZnRCald2ZEtOdkpxd1hLZmdJN3I0T1V4MDViQ3ZraGFPOVNVVk9uM2ZJ?=
 =?utf-8?B?dWNXaitWQ2h6VHFyNllRZ3VzUWg3RGRkT3hlZlQwUzlIcFIwaDVUMXVzZ00v?=
 =?utf-8?B?NXIyWC9jT0dzaG0yQkVNcTBxT3p5NDFUSGxyWWlJTWtoTXJQRk5sKzZrbGpB?=
 =?utf-8?B?WVlnNU9GQkp2NG5Ua20rNGtnR05WUXBqNE81VlFtK05VaE5Vd0FxblN2VjFy?=
 =?utf-8?B?VkZiWk0zRDBSSU1ndWkzNFQ2U2JHLzlhVGJPc2RqYWlOMEdIZjdRcVRQaG52?=
 =?utf-8?B?WUZuNStlNHVlN3BBY3pmYWhIRU5XYXpMUXVwbzM5TVpOM1dHblBuVlFRV2JL?=
 =?utf-8?B?TzZjTDBLYnZCeTg0NDJaUjVXWkFnL2JnMDZxaXhaQyt0NjNBYlNIWWlCb0Q2?=
 =?utf-8?B?NVJJWDNWM0RXQXZuVGprNVJKUUtTZGJLMm40eHkzZzFuUmVab3h3QVJ3d0RW?=
 =?utf-8?B?Z05kWUNKVGtRTjQ5aHVnU29OUXR5K2xHd2F1N1lkcUhtc3AxVXlrUE1WazNG?=
 =?utf-8?B?N2xBNjlBWUk2MVRubTIzdjNqYmpjTDFsang3WlBKRVRXRXM0eFhpQzEvV2Js?=
 =?utf-8?Q?1LXHgfxFWSEYPwhqAPNUzu3WD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fba7f327-c94b-4a21-1dee-08ddb031bd6b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 19:36:23.8195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 58y5BJDpOVNY9PjYhcB6L9PUPud1K5j4HoW0Ku71LvtdzPyXzXF9yysRFDlazREyA+QPm/dVbJL1gQZ1kVuhHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4128

On 6/20/2025 12:26 PM, Alex Deucher wrote:
> Hi,
> 
> Updated amdgpu firmwares.
> 
> The following changes since commit a26e413e7481d12ab5a53f77e0cdde2d5be937d8:
> 
>    amdgpu: update dmcub fw for dcn32 and dcn401 (2025-06-19 20:35:25 +0000)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/kernel-firmware/drm-firmware.git tags/amd-2025-06-20
> 
> for you to fetch changes up to 655062ef7f004eb15266b0fca6a8f4cb71cd6eea:
> 
>    amdgpu: update renoir firmware (2025-06-20 13:14:15 -0400)
> 
> ----------------------------------------------------------------
> amd-2025-06-20:
> 
> Update amdgpu firmwares.
> Add gfx9 ip_discovery firmwares.
> 
> ----------------------------------------------------------------
> Alex Deucher (60):
>        amdgpu: update aldebaran firmware
>        amdgpu: update dimgrey_cavefish firmware
>        amdgpu: update gc 11.0.1 firmware
>        amdgpu: update vcn 4.0.2 firmware
>        amdgpu: update gc 11.5.0 firmware
>        amdgpu: update vcn 4.0.5 firmware
>        amdgpu: update beige_goby firmware
>        amdgpu: update gc 9.4.3 firmware
>        amdgpu: update psp 13.0.6 firmware
>        amdgpu: update gc 9.4.4 firmware
>        amdgpu: update psp 13.0.14 firmware
>        amdgpu: update gc 11.0.0 firmware
>        amdgpu: update psp 13.0.0 firmware
>        amdgpu: update smu 13.0.0 firmware
>        amdgpu: update vcn 4.0.0 firmware
>        amdgpu: add arcturus IP discovery firmware
>        amdgpu: add gc 9.5.0 firmware
>        amdgpu: add psp 13.0.12 firmware
>        amdgpu: add sdma 4.4.4 firmware
>        amdgpu: add vcn 5.0.1 firmware
>        amdgpu: add gc 11.0.0 kicker firmware
>        amdgpu: add psp 13.0.0 kicker firmware
>        amdgpu: add smu 13.0.0 kicker firmware
>        amdgpu: update navi10 firmware
>        amdgpu: update vangogh firmware
>        amdgpu: update navi12 firmware
>        amdgpu: update gc 11.0.3 firmware
>        amdgpu: update psp 13.0.10 firmware
>        amdgpu: update smu 13.0.10 firmware
>        amdgpu: update gc 10.3.6 firmware
>        amdgpu: update vega10 firmware
>        amdgpu: update navi14 firmware
>        amdgpu: update gc 11.0.2 firmware
>        amdgpu: update psp 13.0.7 firmware
>        amdgpu: update vcn 4.0.4 firmware
>        amdgpu: update smu 13.0.7 firmware
>        amdgpu: update vega12 firmware
>        amdgpu: update vega20 firmware
>        amdgpu: add raven ip discovery firmware
>        amdgpu: add picasso ip discovery firmware
>        amdgpu: update gc 11.0.4 firmware
>        amdgpu: update psp 13.0.11 firmware
>        amdgpu: update gc 11.5.1 firmware
>        amdgpu: update psp 14.0.1 firmware
>        amdgpu: update vcn 4.0.6 firmware
>        amdgpu: update gc 12.0.0 firmware
>        amdgpu: update psp 14.0.2 firmware
>        amdgpu: update sdma 7.0.0 firmware
>        amdgpu: update smu 14.0.2 firmware
>        amdgpu: add raven2 ip discovery firmware
>        amdgpu: update sienna cichlid firmware
>        amdgpu: update gc 11.5.2 firmware
>        amdgpu: update psp 14.0.4 firmware
>        amdgpu: update navy flounder firmware
>        amdgpu: update gc 12.0.1 firmware
>        amdgpu: update psp 14.0.3 firmware
>        amdgpu: update sdma 7.0.1 firmware
>        amdgpu: update smu 14.0.3 firmware
>        amdgpu: update vcn 5.0.0 firmware
>        amdgpu: update renoir firmware
> 
>   WHENCE                            |  20 ++++++++++++++++++++
>   amdgpu/aldebaran_ip_discovery.bin | Bin 0 -> 732 bytes
>   amdgpu/aldebaran_smc.bin          | Bin 242688 -> 242688 bytes
>   amdgpu/aldebaran_sos.bin          | Bin 446176 -> 446208 bytes
>   amdgpu/arcturus_ip_discovery.bin  | Bin 0 -> 936 bytes
>   amdgpu/beige_goby_ce.bin          | Bin 263296 -> 263296 bytes
>   amdgpu/beige_goby_me.bin          | Bin 263424 -> 263424 bytes
>   amdgpu/beige_goby_mec.bin         | Bin 268160 -> 268160 bytes
>   amdgpu/beige_goby_mec2.bin        | Bin 268160 -> 268160 bytes
>   amdgpu/beige_goby_pfp.bin         | Bin 263424 -> 263424 bytes
>   amdgpu/beige_goby_ta.bin          | Bin 247040 -> 247040 bytes
>   amdgpu/beige_goby_vcn.bin         | Bin 579824 -> 580080 bytes
>   amdgpu/dimgrey_cavefish_ce.bin    | Bin 263296 -> 263296 bytes
>   amdgpu/dimgrey_cavefish_me.bin    | Bin 263424 -> 263424 bytes
>   amdgpu/dimgrey_cavefish_mec.bin   | Bin 268160 -> 268160 bytes
>   amdgpu/dimgrey_cavefish_mec2.bin  | Bin 268160 -> 268160 bytes
>   amdgpu/dimgrey_cavefish_pfp.bin   | Bin 263424 -> 263424 bytes
>   amdgpu/dimgrey_cavefish_ta.bin    | Bin 247040 -> 247040 bytes
>   amdgpu/dimgrey_cavefish_vcn.bin   | Bin 579824 -> 580080 bytes
>   amdgpu/gc_10_3_6_rlc.bin          | Bin 177104 -> 177104 bytes
>   amdgpu/gc_11_0_0_imu_kicker.bin   | Bin 0 -> 132352 bytes
>   amdgpu/gc_11_0_0_mes_2.bin        | Bin 256624 -> 257072 bytes
>   amdgpu/gc_11_0_0_rlc_kicker.bin   | Bin 0 -> 185376 bytes
>   amdgpu/gc_11_0_1_mes_2.bin        | Bin 256688 -> 256544 bytes
>   amdgpu/gc_11_0_2_mes_2.bin        | Bin 256624 -> 257072 bytes
>   amdgpu/gc_11_0_3_mes_2.bin        | Bin 256688 -> 257136 bytes
>   amdgpu/gc_11_0_4_mes_2.bin        | Bin 256688 -> 256544 bytes
>   amdgpu/gc_11_5_0_rlc.bin          | Bin 166528 -> 166528 bytes
>   amdgpu/gc_11_5_1_rlc.bin          | Bin 161040 -> 161040 bytes
>   amdgpu/gc_11_5_2_me.bin           | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_5_2_mec.bin          | Bin 268640 -> 268160 bytes
>   amdgpu/gc_11_5_2_mes1.bin         | Bin 233520 -> 234288 bytes
>   amdgpu/gc_11_5_2_pfp.bin          | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_5_2_rlc.bin          | Bin 162096 -> 162096 bytes
>   amdgpu/gc_12_0_0_me.bin           | Bin 422592 -> 419776 bytes
>   amdgpu/gc_12_0_0_mec.bin          | Bin 447456 -> 447456 bytes
>   amdgpu/gc_12_0_0_pfp.bin          | Bin 352304 -> 352016 bytes
>   amdgpu/gc_12_0_0_uni_mes.bin      | Bin 712656 -> 721312 bytes
>   amdgpu/gc_12_0_1_me.bin           | Bin 422592 -> 419776 bytes
>   amdgpu/gc_12_0_1_mec.bin          | Bin 447456 -> 447456 bytes
>   amdgpu/gc_12_0_1_pfp.bin          | Bin 352304 -> 352016 bytes
>   amdgpu/gc_12_0_1_uni_mes.bin      | Bin 712656 -> 721312 bytes
>   amdgpu/gc_9_4_3_mec.bin           | Bin 268736 -> 268736 bytes
>   amdgpu/gc_9_4_3_rlc.bin           | Bin 38708 -> 38708 bytes
>   amdgpu/gc_9_4_3_sjt_mec.bin       | Bin 268736 -> 268736 bytes
>   amdgpu/gc_9_4_4_mec.bin           | Bin 268736 -> 268736 bytes
>   amdgpu/gc_9_4_4_rlc.bin           | Bin 48076 -> 43388 bytes
>   amdgpu/gc_9_4_4_sjt_mec.bin       | Bin 268736 -> 268736 bytes
>   amdgpu/gc_9_5_0_mec.bin           | Bin 0 -> 269200 bytes
>   amdgpu/gc_9_5_0_rlc.bin           | Bin 0 -> 38700 bytes
>   amdgpu/gc_9_5_0_sjt_mec.bin       | Bin 0 -> 269200 bytes
>   amdgpu/navi10_asd.bin             | Bin 197120 -> 197120 bytes
>   amdgpu/navi10_ce.bin              | Bin 263296 -> 263296 bytes
>   amdgpu/navi10_me.bin              | Bin 263424 -> 263424 bytes
>   amdgpu/navi10_mec.bin             | Bin 268160 -> 268160 bytes
>   amdgpu/navi10_mec2.bin            | Bin 268160 -> 268160 bytes
>   amdgpu/navi10_pfp.bin             | Bin 263424 -> 263424 bytes
>   amdgpu/navi10_ta.bin              | Bin 37632 -> 37632 bytes
>   amdgpu/navi10_vcn.bin             | Bin 404032 -> 404288 bytes
>   amdgpu/navi12_asd.bin             | Bin 197120 -> 197120 bytes
>   amdgpu/navi12_ce.bin              | Bin 263296 -> 263296 bytes
>   amdgpu/navi12_me.bin              | Bin 263424 -> 263424 bytes
>   amdgpu/navi12_mec.bin             | Bin 268160 -> 268160 bytes
>   amdgpu/navi12_mec2.bin            | Bin 268160 -> 268160 bytes
>   amdgpu/navi12_pfp.bin             | Bin 263424 -> 263424 bytes
>   amdgpu/navi12_ta.bin              | Bin 37632 -> 37632 bytes
>   amdgpu/navi12_vcn.bin             | Bin 404032 -> 404288 bytes
>   amdgpu/navi14_asd.bin             | Bin 197120 -> 197120 bytes
>   amdgpu/navi14_ce.bin              | Bin 263296 -> 263296 bytes
>   amdgpu/navi14_me.bin              | Bin 263424 -> 263424 bytes
>   amdgpu/navi14_mec.bin             | Bin 268160 -> 268160 bytes
>   amdgpu/navi14_mec2.bin            | Bin 268160 -> 268160 bytes
>   amdgpu/navi14_pfp.bin             | Bin 263424 -> 263424 bytes
>   amdgpu/navi14_ta.bin              | Bin 37632 -> 37632 bytes
>   amdgpu/navi14_vcn.bin             | Bin 404032 -> 404288 bytes
>   amdgpu/navy_flounder_ce.bin       | Bin 263296 -> 263296 bytes
>   amdgpu/navy_flounder_me.bin       | Bin 263424 -> 263424 bytes
>   amdgpu/navy_flounder_mec.bin      | Bin 268160 -> 268160 bytes
>   amdgpu/navy_flounder_mec2.bin     | Bin 268160 -> 268160 bytes
>   amdgpu/navy_flounder_pfp.bin      | Bin 263424 -> 263424 bytes
>   amdgpu/navy_flounder_ta.bin       | Bin 247040 -> 247040 bytes
>   amdgpu/navy_flounder_vcn.bin      | Bin 579824 -> 580080 bytes
>   amdgpu/picasso_ip_discovery.bin   | Bin 0 -> 628 bytes
>   amdgpu/psp_13_0_0_sos.bin         | Bin 268304 -> 268304 bytes
>   amdgpu/psp_13_0_0_sos_kicker.bin  | Bin 0 -> 268976 bytes
>   amdgpu/psp_13_0_0_ta.bin          | Bin 259328 -> 259328 bytes
>   amdgpu/psp_13_0_0_ta_kicker.bin   | Bin 0 -> 259328 bytes
>   amdgpu/psp_13_0_10_ta.bin         | Bin 251328 -> 251328 bytes
>   amdgpu/psp_13_0_11_ta.bin         | Bin 238592 -> 238592 bytes
>   amdgpu/psp_13_0_12_sos.bin        | Bin 0 -> 410416 bytes
>   amdgpu/psp_13_0_12_ta.bin         | Bin 0 -> 66880 bytes
>   amdgpu/psp_13_0_14_sos.bin        | Bin 397632 -> 397632 bytes
>   amdgpu/psp_13_0_14_ta.bin         | Bin 67904 -> 67904 bytes
>   amdgpu/psp_13_0_6_sos.bin         | Bin 787040 -> 787040 bytes
>   amdgpu/psp_13_0_6_ta.bin          | Bin 88960 -> 88960 bytes
>   amdgpu/psp_13_0_7_ta.bin          | Bin 234496 -> 234496 bytes
>   amdgpu/psp_14_0_1_toc.bin         | Bin 2560 -> 2560 bytes
>   amdgpu/psp_14_0_2_sos.bin         | Bin 421216 -> 421216 bytes
>   amdgpu/psp_14_0_2_ta.bin          | Bin 258016 -> 258016 bytes
>   amdgpu/psp_14_0_3_sos.bin         | Bin 435632 -> 435632 bytes
>   amdgpu/psp_14_0_3_ta.bin          | Bin 270624 -> 270624 bytes
>   amdgpu/psp_14_0_4_ta.bin          | Bin 238592 -> 238592 bytes
>   amdgpu/psp_14_0_4_toc.bin         | Bin 2560 -> 2560 bytes
>   amdgpu/raven2_ip_discovery.bin    | Bin 0 -> 628 bytes
>   amdgpu/raven_ip_discovery.bin     | Bin 0 -> 628 bytes
>   amdgpu/renoir_asd.bin             | Bin 193024 -> 197120 bytes
>   amdgpu/sdma_4_4_4.bin             | Bin 0 -> 34304 bytes
>   amdgpu/sdma_7_0_0.bin             | Bin 45824 -> 47872 bytes
>   amdgpu/sdma_7_0_1.bin             | Bin 46336 -> 47104 bytes
>   amdgpu/sienna_cichlid_ce.bin      | Bin 263296 -> 263296 bytes
>   amdgpu/sienna_cichlid_me.bin      | Bin 263424 -> 263424 bytes
>   amdgpu/sienna_cichlid_mec.bin     | Bin 268160 -> 268160 bytes
>   amdgpu/sienna_cichlid_mec2.bin    | Bin 268160 -> 268160 bytes
>   amdgpu/sienna_cichlid_pfp.bin     | Bin 263424 -> 263424 bytes
>   amdgpu/sienna_cichlid_ta.bin      | Bin 374528 -> 374528 bytes
>   amdgpu/sienna_cichlid_vcn.bin     | Bin 579824 -> 580080 bytes
>   amdgpu/smu_13_0_0.bin             | Bin 292452 -> 292452 bytes
>   amdgpu/smu_13_0_0_kicker.bin      | Bin 0 -> 261888 bytes
>   amdgpu/smu_13_0_10.bin            | Bin 271520 -> 271520 bytes
>   amdgpu/smu_13_0_7.bin             | Bin 287080 -> 287080 bytes
>   amdgpu/smu_14_0_2.bin             | Bin 333236 -> 333236 bytes
>   amdgpu/smu_14_0_3.bin             | Bin 333236 -> 333236 bytes
>   amdgpu/vangogh_ce.bin             | Bin 263296 -> 263296 bytes
>   amdgpu/vangogh_me.bin             | Bin 263424 -> 263424 bytes
>   amdgpu/vangogh_mec.bin            | Bin 267920 -> 268160 bytes
>   amdgpu/vangogh_mec2.bin           | Bin 267920 -> 268160 bytes
>   amdgpu/vangogh_pfp.bin            | Bin 263424 -> 263424 bytes
>   amdgpu/vcn_4_0_0.bin              | Bin 395664 -> 395664 bytes
>   amdgpu/vcn_4_0_2.bin              | Bin 395632 -> 395664 bytes
>   amdgpu/vcn_4_0_4.bin              | Bin 395664 -> 395664 bytes
>   amdgpu/vcn_4_0_5.bin              | Bin 395632 -> 395664 bytes
>   amdgpu/vcn_4_0_6.bin              | Bin 393456 -> 395664 bytes
>   amdgpu/vcn_4_0_6_1.bin            | Bin 393456 -> 395664 bytes
>   amdgpu/vcn_5_0_0.bin              | Bin 440848 -> 433552 bytes
>   amdgpu/vcn_5_0_1.bin              | Bin 0 -> 207440 bytes
>   amdgpu/vega10_asd.bin             | Bin 197120 -> 197120 bytes
>   amdgpu/vega10_ip_discovery.bin    | Bin 0 -> 656 bytes
>   amdgpu/vega12_asd.bin             | Bin 197120 -> 197120 bytes
>   amdgpu/vega12_ip_discovery.bin    | Bin 0 -> 656 bytes
>   amdgpu/vega20_asd.bin             | Bin 197120 -> 197120 bytes
>   amdgpu/vega20_ip_discovery.bin    | Bin 0 -> 564 bytes
>   141 files changed, 20 insertions(+)
>   create mode 100644 amdgpu/aldebaran_ip_discovery.bin
>   create mode 100644 amdgpu/arcturus_ip_discovery.bin
>   create mode 100644 amdgpu/gc_11_0_0_imu_kicker.bin
>   create mode 100644 amdgpu/gc_11_0_0_rlc_kicker.bin
>   create mode 100644 amdgpu/gc_9_5_0_mec.bin
>   create mode 100644 amdgpu/gc_9_5_0_rlc.bin
>   create mode 100644 amdgpu/gc_9_5_0_sjt_mec.bin
>   create mode 100644 amdgpu/picasso_ip_discovery.bin
>   create mode 100644 amdgpu/psp_13_0_0_sos_kicker.bin
>   create mode 100644 amdgpu/psp_13_0_0_ta_kicker.bin
>   create mode 100644 amdgpu/psp_13_0_12_sos.bin
>   create mode 100644 amdgpu/psp_13_0_12_ta.bin
>   create mode 100644 amdgpu/raven2_ip_discovery.bin
>   create mode 100644 amdgpu/raven_ip_discovery.bin
>   create mode 100644 amdgpu/sdma_4_4_4.bin
>   create mode 100644 amdgpu/smu_13_0_0_kicker.bin
>   create mode 100644 amdgpu/vcn_5_0_1.bin
>   create mode 100644 amdgpu/vega10_ip_discovery.bin
>   create mode 100644 amdgpu/vega12_ip_discovery.bin
>   create mode 100644 amdgpu/vega20_ip_discovery.bin

Merged, thanks.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/592
