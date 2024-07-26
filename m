Return-Path: <SRS0=22Zv=O2=amd.com=Rodrigo.Siqueira@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755B7C3DA4A
	for <linux-firmware@archiver.kernel.org>; Fri, 26 Jul 2024 23:37:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3C2C8C4AF0B; Fri, 26 Jul 2024 23:37:16 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B90B7C32782;
	Fri, 26 Jul 2024 23:37:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B90B7C32782
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CKgi5BF61x8bYlfS6jtLRymegP6Z44eaqbyUoGfuYzram86oq+QgLkzt4X+cCQvA4gm6CpUv+sfo1cFWEOGr8DxRcOZzrZbUR/IxT+2U1YWT9hsbyjdhuY+Hk1GVF0fOdhwC4aRt28esXXNh9Aa8qdw+DInQg2O885uHMuWzXoEf+LiiUqTWvMBV0vTc4sZZdXRd/3jULJqaEfPfdVRgBJO84cYL9+ILxC3Ng4yGMWJdcgmiVQocze7zmDo5u8f5H3OQD28oGiwH9Bt0WCUrP2CUVOdz5Jw7QUOtIyQgV9orGwPhWjM37JEang1lRgXJ/+e0CQp9lWR/LYg9NrP4SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8mUFT/H/31OBWPXMva6ADM79x69oPBjV+YbssmtBHH0=;
 b=FiyZuCb+/5EhOx1HjC97LECHHXDyLy5h98Vw8r7NnKPe0cEWPW0LhfJP3T220/LA8iTjhFG/E8gSbUiXFk223fB9t/bvgbIyqaXPFaaChfaykqDsFOS4u0VxB/TRgFEr36TSqg+rWKjlUUJEaj4kmfGIPVix1TRkGUBUo1HGUzB0cCHzPr1IbIWUA4rYi0v5UWqP82ebIGyHLkyGvp53AqJCxOukj37a65ENH6GKQ4LtcIo6ErF/ZpY8jIOFNS8loZMVYqXiZ3+EXQpaK3F8q4zavt6iU3oYs/EeudU8uwThlK/NX1CZA5IGl6jv3/hehg6Fyav98e4ktJCWaW4EQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8mUFT/H/31OBWPXMva6ADM79x69oPBjV+YbssmtBHH0=;
 b=1L48Bb1iViUb3kdjeUbhZatuu4cNZK5gtCWvK/vxqnWVqWoTpBrVklOjJFpIbSu2TtXY0kqNwyUSW09PJnHoffGmiZjmeD0HQiwXEY6TmOCDRs2VDVnyHKj1BIRXsa6cMimtx9qTH9GfNYi/PKsp6rkjBxQrCfkEgyddydfK4lY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW6PR12MB8733.namprd12.prod.outlook.com (2603:10b6:303:24c::8)
 by SJ2PR12MB9238.namprd12.prod.outlook.com (2603:10b6:a03:55d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28; Fri, 26 Jul
 2024 23:37:10 +0000
Received: from MW6PR12MB8733.namprd12.prod.outlook.com
 ([fe80::71a6:a9da:c464:fa2e]) by MW6PR12MB8733.namprd12.prod.outlook.com
 ([fe80::71a6:a9da:c464:fa2e%5]) with mapi id 15.20.7784.020; Fri, 26 Jul 2024
 23:37:10 +0000
Message-ID: <54688e5e-331b-4f5d-b3eb-95119a0f6e69@amd.com>
Date: Fri, 26 Jul 2024 17:37:05 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: pull request: amdgpu: update DMCUB firmware to v0.0.227.0
Content-Language: en-US
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Deepak Sharma <deepak.sharma@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>
References: <20240725231548.145196-1-Rodrigo.Siqueira@amd.com>
 <CA+5PVA4nh=ry2srNz0eWdi+xnOmARx-FL43iK4hZM74igZ1b4w@mail.gmail.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <CA+5PVA4nh=ry2srNz0eWdi+xnOmARx-FL43iK4hZM74igZ1b4w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0564.namprd03.prod.outlook.com
 (2603:10b6:408:138::29) To MW6PR12MB8733.namprd12.prod.outlook.com
 (2603:10b6:303:24c::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR12MB8733:EE_|SJ2PR12MB9238:EE_
X-MS-Office365-Filtering-Correlation-Id: 6979089f-02c8-4c7b-b81a-08dcadcbde3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VW1RYWJxc0FIS2JxVWloT0Z3RDFqYThQRjl0Y2REay9VU0RUbmhzbjI3NFhl?=
 =?utf-8?B?NzBsRUg1WWJCZXI2NjJxV1JmQVV1TWxpSWJaRUd2WGRFVXdpZTUxM0RZWVVt?=
 =?utf-8?B?d05oQmJ2dEVWWFJyN0JqMG5UNTJwakt5enJUZ2MycGpkZG9xSVpNUGZQcGd2?=
 =?utf-8?B?enhZQlYwMk42T3ZnZ0VadWhYWVNocEQyVGY2NDRZUGhFOW9aZmJlb0UwR0lk?=
 =?utf-8?B?Z1JHeDZuNzk4UkFWTmxxNTMzWU5EckRBZUVrbXV3Zk5IUCtDTm4xRWRvVzgr?=
 =?utf-8?B?aEhyTmlURGNQNkwzbWYyMjl1MmZWVlJOc0xhNmFjamdvKytlNFZ3OFlueXY1?=
 =?utf-8?B?SGpZSW8xeVg1ZDBreWprUlNFZkhWRFpzK1lqR254dEdHeGpydnJidUNlQWd2?=
 =?utf-8?B?QndESlRuZC82eHpReXhUMzFhd1Rta2dtUk03SWlBMDlEU1VOcHpFQTEwYzRF?=
 =?utf-8?B?OHBHakpmUzRDeE5hbWJtditwNm94dFVQSE1WZ3plVy9IY2tvc0JlazBjVUxB?=
 =?utf-8?B?TGJRTlVJN083dldiUjV5VkcxOXBkOHBVc01DbkpvclFnWFBacit1N3g5U1pT?=
 =?utf-8?B?OTBPV2I5eFFvR0xuQWZQMVduSHNFWGhuYlRQUUllRE1CeXRaZWNMNU5ZRWh4?=
 =?utf-8?B?TUg5QU5rdnpNYkphWGR4VkFTZDFINXRkWHZYT0hrWFByQldWQXB5VGlEQTRB?=
 =?utf-8?B?eHEwYytBRGl4ckJmZnFlT2JuU1ZGSzRnQUZNeDk5K2ZCaGtCV2N0OGdXQTJW?=
 =?utf-8?B?UDBCelV3NHZpdVd2OXp2ZXBjMHJtajJuMFluMVhrZGt4M1R5RHM4aGxwYlFJ?=
 =?utf-8?B?RlNSWit4WFFlSTgyT3c4eUQxM2VTRndzbFBMMmtheVpMTUZpU1U0SDE1MG90?=
 =?utf-8?B?U1hpODJqS05wUXZtNzh5OGo5dWZUTnVrcDhJOXZDTytacTNJMWkwRnl3Vmli?=
 =?utf-8?B?aTFSK1VXQkdaeitYSklEVGF6bjcxN0VSTGtraDliaTFnYTJpYUNxeFk1NnVU?=
 =?utf-8?B?Vmt1NGVmQ005eHBkcXpGM0QzdkxvMXdRZElKWkpvMmdMZEpGQkd0YVVBK2Zm?=
 =?utf-8?B?NDVXRkFWeTdGSEFNelZuMXNSamdjd0FaTll5aWs4dXdGZVNGY25EMkNaTmlW?=
 =?utf-8?B?dngvRS9pTlBHNnFheEMrVFk1aGlNdEs1d0gxUmNSYURBT0ROQkhpaW9EQ2p5?=
 =?utf-8?B?S3JqYkxXcHlPQWM2RWlSakZWdjFqQm1PN0MwNFpCcTAxdnJ6a3RPU2Z3OUdt?=
 =?utf-8?B?VExvTUxCSElQaUxZaGVPcUVQTVBWMFNZV0FLOEttTFZXdUJodjJVcEgyaGg0?=
 =?utf-8?B?SksvZmc0azR4R0ZGbTNEUVNwRHpTUEI4THZiQjhqQi9nMkkwMkNoUlJvRmxT?=
 =?utf-8?B?bFZvOHJZdUphbnFlaU56bC9zeDdvS0R6ZldEeUo3S1JrTzRITGFvSmtNbDN6?=
 =?utf-8?B?aFNWWFR4RkJQVXB6NTVzUnBUejNBVEQ1T1BZWVFWNlh6WjUwejBXQTN3VjNv?=
 =?utf-8?B?UVBFdVVjVnByWHVOUUYrall1ZzFycXE4dUVqeFhTYlhrbk1KaTQ1NzJhalRW?=
 =?utf-8?B?TURpWkNFbXFCR0htVUJraHhyZ0FlRmFlM3cva3p0QXpVZW4vMmpGSmxGcW1F?=
 =?utf-8?B?dUFqek5QNHNTcm1sMWk5QzJNRmNPMUpkbTNuSUNBK3hSdDd2V1B4bUs2VE9D?=
 =?utf-8?B?a2dPZkZ0d1FIU2xJZWkwZi9CRzQzZ25tcnJOcytIR2ZDcVY5d2lVQlpjZTI1?=
 =?utf-8?Q?9o22uDsv63vv7Ap0ok=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW6PR12MB8733.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UE84TmxKWlE5RjI0Ymo4TnllcXlhdFQ4UmxCY0VWQmZYM0lTRDUzYU9UTmVJ?=
 =?utf-8?B?a1U2bFhmYjlGQXJ0dmF2RzVJNHoxbVpaVFVxakJHN3o5RTB2bWhUQittNUJP?=
 =?utf-8?B?RHFXaHQ5d2tNZUtOdW9ScG5pM3JkVnFmY3p1Z09ObTVwRWc4WERjajVWeHky?=
 =?utf-8?B?Z3RGdkdQSm9aa3RBbEtrQ3NSY3dSalZIWkxhUzhXY2M0ZTBzcE1JcVFzYlds?=
 =?utf-8?B?c2JHTTBXSHFFZjltMlRQL2JWT1JiNGlpTDk0aGk4VzZmOUYxQXdqcndYLzR0?=
 =?utf-8?B?LzBleTRtWjk1TmVFVm0rNFB6MEtyQUZ4WlBVd2xUenBIM1c5SXNveUhrL2NR?=
 =?utf-8?B?QitNR2QzUnRKcWZ3U2ZMRzN2bWpNVC9Kc0svQm55Q1pHMGd3eGJPNldwV0xM?=
 =?utf-8?B?TEkxR3pEaWFpb2JZUTdnQ2RtbFh4d3paMVg5NExsZWp0TXh6N0wrVVBoTEVX?=
 =?utf-8?B?NnlaUkpiRTZ4eTQ1OWpHcGNVUGlhbU5RNi81KzkrK1R0SEFoT2lMUnlzcVcy?=
 =?utf-8?B?cnZTTzdHN3FVOWRzc1lvQVVyVmpvcmVTNjN0ME1TMDFHTnF5aTduOFVGTi8r?=
 =?utf-8?B?L1k2Z3h1clVUczBkV2w0L0lQcHJ6ckVNaHlWUnd4cEtFWVpCNzZZZCtwNXFK?=
 =?utf-8?B?NS9aUzEvR3Jqbnl2dWhMTVVldHhuRnBWUGoyYXJ5U1p2YVY5V2ZqK21yZS90?=
 =?utf-8?B?am1yZEhOVVc4bXRjbHBpV25kOWFYTUtWM2tQK2dOZWowYlJHU2lZZzBWMUdP?=
 =?utf-8?B?MDhCRHV5SDZRSkk4RXpqZGo2Z0YwNzE0VzY5d0Nib0tCdU9aMERudkNwVkV1?=
 =?utf-8?B?d05VdFhHTmRVdW16Q1draUsxVTBGbWd3Zk9ienllekZMQWhOUXhzcTlidlRZ?=
 =?utf-8?B?NVNDYjZQL210L01RcmVyLzJxVVMyYkxLbENFeU5NVGdCdE9LUDd0RmtuaE44?=
 =?utf-8?B?dWQ1cGprV3ozRGs5Tnc2RnJMTkQ5QlRNTDQwN1hYVUNUbE5lbkhpRlYwcy9L?=
 =?utf-8?B?QW4yd0czK1JGZm9Ob3RkOElqNUVRU2pna0IzbVJpVXgrU04yWk9DNHJLSnJ3?=
 =?utf-8?B?a1JVVlNZZ0cyYjFPcWRLVVM1L0xFYm9KRTM0Z0x5bHU4bk0wNmZpalVuSTY2?=
 =?utf-8?B?NDJhUWdIcjAwaXJaNUptc3VLNkc3MGh6bFlnUDdsUUhydlhnaVl2SnQwaUo2?=
 =?utf-8?B?eHRySlEvcDVXdHREZmFkdTBsZDFqUElmc21WOUh2Q1IzdnpUZUN5WnpQUkRk?=
 =?utf-8?B?eFpib2VnSU0yc3NZcUYxL2haUGlEck9KNzkyOHVickhKZzFnZk44TGs1alFl?=
 =?utf-8?B?M3BySDNPdkNtY2tFSmNkbExVLytBVStSQ2NaT1cxUGQxb1pEcS9hR0VJOGZs?=
 =?utf-8?B?TzFBRkFNUUsvWm43dmJwUk5mZmU5S1VodzJtT3Rqc0lob1RYY0NKNFQ0VFVK?=
 =?utf-8?B?aU5Ea3hpUXQwc0lyaXFieXZ0TktVbUJ5b2t1cjBpWk9BOHlwYmdUOVVHRzZR?=
 =?utf-8?B?akRjK1pQL2ZkeC9MZkhqazE1Q2ltNnhucDdqelhOSlVSdjdDdDVqN1J4dkg1?=
 =?utf-8?B?d1ZRdnJLZFQ1cDZTWmFvd2dMZjVWVTNkaHlqOEdQSTl1ZCt4RFJVREs5RXpk?=
 =?utf-8?B?Q0lDSVMzZGM4QXFjYnBLNVJBNnpTV0RRNGlGS0hXN1htdmdpQStRMGJzUUZz?=
 =?utf-8?B?Y0Y1SjZwZjhkSnNoTnVKcERmazJOZkxxTmRFZXZlOHB1a01WNGFaaVlscG9Q?=
 =?utf-8?B?QU9uam9rU0JRMFhDWVdJSmVsYVJGU01WR2QyTUkwM0NoNFVwMHIzV0ZZa1ll?=
 =?utf-8?B?bkh2enA5eElkTDdTWm9EVTZ3SW01ZGwwZ3prOUdRUHhocUY0dXMwdU81eVg0?=
 =?utf-8?B?YVNQMS9OS3NBa3hKTjl5TXdDYjRKMjFFK2VxR3BlSS9IYUlmc3NKSElVbmhz?=
 =?utf-8?B?eWVqM1VBdGtqOWh3Ri9BOG5HWGhJR29VYTFQbkMyK0daemMvWEcxc2dtQ2Ey?=
 =?utf-8?B?Zi85Tzc2M0xJN3JwZU5pcmRETGtPckZGNGZwKzh0dHhLbVlBOE9Md0hGeXhp?=
 =?utf-8?B?QzRrNmExV1ZJSDdkWDF0NjhSeXdmejhJSldGUitZb21SakZPL0tselIxWllu?=
 =?utf-8?Q?kqi9GV2AxLzGLKIgD60l5Co6d?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6979089f-02c8-4c7b-b81a-08dcadcbde3d
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB8733.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 23:37:09.9843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LDEbDbxHlRCDvxxj46Y+q8/6XPFci4kTucJAjGZ1qi1hFoI8yz+x4QifUFkMh+vS0Zb6EBxOsP5B5/n1oh6vEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9238



On 7/26/24 5:41 AM, Josh Boyer wrote:
> On Thu, Jul 25, 2024 at 7:16 PM Rodrigo Siqueira
> <Rodrigo.Siqueira@amd.com> wrote:
>>
>> The following changes since commit b29f570a9b03d30e33966d653a214597f8132b4b:
>>
>>    amdgpu: update DMCUB to v0.0.227.0 for DCN35 and DCN351 (2024-07-25 15:21:21 -0600)
>>
>> are available in the Git repository at:
>>
>>    git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2024-07-25
> 
> This tree produces merge conflicts.
> 
> [jwboyer@vader linux-firmware]$ git fetch
> https://gitlab.freedesktop.org/drm/firmware.git tags/amd-2024-07-25
> remote: Enumerating objects: 603, done.
> remote: Counting objects: 100% (596/596), done.
> remote: Compressing objects: 100% (91/91), done.
> remote: Total 503 (delta 484), reused 425 (delta 412), pack-reused 0 (from 0)
> Receiving objects: 100% (503/503), 4.55 MiB | 17.76 MiB/s, done.
> Resolving deltas: 100% (484/484), completed with 66 local objects.
>  From https://gitlab.freedesktop.org/drm/firmware
>   * tag                 amd-2024-07-25 -> FETCH_HEAD
> [jwboyer@vader linux-firmware]$ git merge --no-gpg-sign --signoff FETCH_HEAD
> Auto-merging WHENCE
> warning: Cannot merge binary files: amdgpu/dcn_3_5_1_dmcub.bin (HEAD
> vs. b29f570a9b03d30e33966d653a214597f8132b4b)
> Auto-merging amdgpu/dcn_3_5_1_dmcub.bin
> CONFLICT (add/add): Merge conflict in amdgpu/dcn_3_5_1_dmcub.bin
> warning: Cannot merge binary files: amdgpu/dcn_3_5_dmcub.bin (HEAD vs.
> b29f570a9b03d30e33966d653a214597f8132b4b)
> Auto-merging amdgpu/dcn_3_5_dmcub.bin
> CONFLICT (add/add): Merge conflict in amdgpu/dcn_3_5_dmcub.bin
> Automatic merge failed; fix conflicts and then commit the result.
> [jwboyer@vader linux-firmware]$

Hi Josh,

Could you try again with the tag amd-2024-07-26?

I rebased our branch against the latest code from the branch main from 
the linux-firmware repo for generating this tag. Hopefully, it will 
address the issue.

Thanks
Siqueira

> 
> josh
> 
>> for you to fetch changes up to b29f570a9b03d30e33966d653a214597f8132b4b:
>>
>>    amdgpu: update DMCUB to v0.0.227.0 for DCN35 and DCN351 (2024-07-25 15:21:21 -0600)
>>
>> ----------------------------------------------------------------

