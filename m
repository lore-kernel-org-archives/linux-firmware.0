Return-Path: <SRS0=ImDa=EN=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269DBC83F12
	for <linux-firmware@archiver.kernel.org>; Mon, 28 Aug 2023 19:19:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E3FE9C433CA; Mon, 28 Aug 2023 19:19:20 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2053.outbound.protection.outlook.com [40.107.100.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 87DA4C433C8;
	Mon, 28 Aug 2023 19:19:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 87DA4C433C8
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bLk7lUnD5k3kmDWz6/SFcJ9K9BPCc2vefVrnBx3VBYjwDBWhYsM5hpSQDOi4ObCHL7NOtOGvqCGMTu9wJdl2NcsozkQxLBI/oZES4g686nX6d4BhefckXF9uYQ4TGidwtNKYJ2IDj/hBg/kwDBln1aYvvXyq8C7ROPs5FOUryEaH+/9fHX4n0XApzPRbZ+wWlpuRxHmo8PAsfFZEb0lZmmmpRZI9ZbmijY0WuLK6e5X4DCA5iyglFP8nWOZXHqIMPLC4yTiV8mpHBSnCVrEWsnOEfkfPLdeP4HAp4S9pZyTYrx76diNc4QMY0C8I+LC6Q3W5InWJBx/rJoZJzK17cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ru0Pew+9qasLizYMCKjMbhdmE/NZXwGuVJkzaE6C9+c=;
 b=RDhu/qBuXs+LtJC3x3zK91ljuuohK2f5EDBNjjviQ4oVq96rHry0lOw+LQiaVpcyp2Wk8uCHyWutHK7Vlo6M7bGZhLe5UZWON9hGo4CCJgKUcs/Ng1kNOcWMxB5CK26VOpXOWC23FTUd3IrXvlDLhN4ouGrQJYtWfPetRqy4KjeB3O3ZvI845Cfezz/FZ5rZj+PbNSxT5/rtFLXvpIneoVXk0l0kC3nieX1QMjddtOO1NL64QhvHXoo1/seUrDnLPap3r5lBOYOZtbNWMT58oBQ+V0V9tnHZdzyzPUTIi8k522I35bJgQttBo5rxcspqJCx5APMKQCBEweTGomkZUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ru0Pew+9qasLizYMCKjMbhdmE/NZXwGuVJkzaE6C9+c=;
 b=2BmO9LRvw4DJRtywOaUlcsL7HyzOI/RlRnOvaRCw86MtjcUhDYWH94BQsxkCySdTsXpBL/oZ40rVF06RytVJ8CDOaFjLA4HP0cr4kYXXLaRP5ZWgfUCKnNt8teZ1uBdQFTnZCatXxzVAhay4ebnkklOrXMejwpq7IaZ4pNBGYZ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB6095.namprd12.prod.outlook.com (2603:10b6:8:9c::19) by
 DM4PR12MB6637.namprd12.prod.outlook.com (2603:10b6:8:bb::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.34; Mon, 28 Aug 2023 19:19:16 +0000
Received: from DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::44a:f414:7a0f:9dae]) by DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::44a:f414:7a0f:9dae%7]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 19:19:16 +0000
Message-ID: <bc746360-4766-459b-b420-3ecbebabb538@amd.com>
Date: Mon, 28 Aug 2023 14:19:15 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: Update of amdgpu DMCUB firmware (2023-08-25)
Content-Language: en-US
To: Benjamin Tissoires <benjamin.tissoires@redhat.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>, Josh Boyer <jwboyer@kernel.org>,
 Wayne.Lin@amd.com, linux-firmware@kernel.org, alexander.deucher@amd.com,
 chandan.vurdigerenataraj@amd.com, deepak.sharma@amd.com
References: <20230825202041.194349-1-hamza.mahfooz@amd.com>
 <CA+5PVA6vBbGK4DznO45gp3N3OEL8ERzyjUfe_fLGMCEZ2NjgYg@mail.gmail.com>
 <12e4c4eb-df91-4a7a-9072-ccfac8679c85@amd.com>
 <dd01d36b-2ff1-4889-a409-e6fcec60af68@amd.com>
 <CAO-hwJLSMuZNzz04pjBC+OLN+yomu7FNJXtaGH8Nauhe01_3kA@mail.gmail.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CAO-hwJLSMuZNzz04pjBC+OLN+yomu7FNJXtaGH8Nauhe01_3kA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN6PR01CA0028.prod.exchangelabs.com (2603:10b6:805:b6::41)
 To DS7PR12MB6095.namprd12.prod.outlook.com (2603:10b6:8:9c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6095:EE_|DM4PR12MB6637:EE_
X-MS-Office365-Filtering-Correlation-Id: d8e283ec-aa9e-41ef-cf56-08dba7fbab84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ufgkjOvIXQz3lSLoxa6C1N/7ld4aHr26+EVVj8aOJMEeF64HYzX9grStaOCeVk8gwCYp6LmN8mJ0pzIxiYjpc5w3lZ7IeHVQusC9UJh2xyv0ze3u1z0+ABUUgPAO/s341tDod2+pOBtqnKxKHwtA0kVi66GdeMy6FLFwDb0snQF7Jmp2S7QiVf87+WmW01IB10Euqgn2lY6wRB9IfUg1yKYfLd1puJUYZ2j4aCR8r3CoiQ/ADq10ZG5AVhxcVSc3Ny5FsQ/FBzQETYSm/FeE5CnUupEIimcGvTMgrfJSFDogpatXSmVRVUq9yOMzWSsnVT4ssTeTLWYI6OgSrVvsWo/6abh1xL+a3CTkTU5Qxp78F8O/bkoAlhorqD7Qxd20xNstFvI566hzv11/LmoCpUTcZPreGX0RO9eM4arCjuKp5K1NVCuIKnVNSjGuBJRnSnGjEEPfwld/tYwz+T3yDYnYpXUPkpQV4PVIcOl9VbkSe0yqlJPMTjFlaNKUvV+oNFZ3xBbUiG+1MSGa7b1zVVMkNHTDpJ1pU0ERxIWAd0B1QI2F5clHZs7/Jyvx7oAxOjR7qHFnqPa42j8IMVqLYlGPzPT8R1WYGZ9e7CzlHYXQBEZ6Gk82KHAdxH6mKrcK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB6095.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(376002)(346002)(136003)(366004)(451199024)(1800799009)(186009)(8676002)(8936002)(4326008)(6916009)(2906002)(36756003)(66476007)(54906003)(316002)(66556008)(66946007)(5660300002)(44832011)(31686004)(15650500001)(41300700001)(6486002)(6506007)(53546011)(2616005)(26005)(6512007)(38100700002)(478600001)(83380400001)(966005)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUJQNnFWZVYwS012YVBHeWV4VVVSUDlsUHNlSFFHTHVoWENDRGlvd2M0d3Rw?=
 =?utf-8?B?TnI2blpiSlJVRTFJem5WYUdPWG9Uc1pkOVo3NnpQTEI0MnJUaHdESTZPQSs0?=
 =?utf-8?B?ZUJDaWZiM0Vqcm9wRHc4ZVVXSngyRWdBR2g0RFVOOVY1QTNwcGY0V011dXEx?=
 =?utf-8?B?SkU5SzNBM1ZlcUpzc2tuNlU2blU2ODhMdCtOMEpjcWRwMjlUVklqR1cvWUJP?=
 =?utf-8?B?bHdIMFF4aDdlQmRvUG1QYkF5Rzg0cEU5aW0xa2dSVitCdW8xeXRPTG40UXNZ?=
 =?utf-8?B?cVRQREh6ZlB3SHJHQ3VrOG05eDdSUXVRcHpySHl4d20xcThxbGtKQndlN2Zy?=
 =?utf-8?B?VXFnSHlBWU1MN0tEa1hPVGYxZmdadDh5TzRIclN3TmhIdmVwdFJBSDV6c09q?=
 =?utf-8?B?UE9aUWh3RUpGK1VjZCtUVEwrdnZQM3ZwSS9UNHlVTmg4S1VndFFOb3M4cUt1?=
 =?utf-8?B?YnNyVGkzRmxkeGtDSlpobVdjSVZxOGU2WitoV2dlTitEbDdMSVA1T2IycldW?=
 =?utf-8?B?L1JjMFNURlh0K1J0Y3o5Tk9WNHJxQlZ0ampCclNQOVVwVzcwanFQR2tPTGpZ?=
 =?utf-8?B?SzZTTnhDM3UrUEtXRGwyTmk4Q2hVdDNlM25CakUwMlRWVjR5bnVMQUF3Lzcv?=
 =?utf-8?B?YVpGMnYrWlpSenlBckp6WlBEUkVjWjVSOC9FaHJ5Q1EyNmRzclJCU2NGQkxm?=
 =?utf-8?B?bmxwcTNjY2NOcW5LZXlnRmpsOENIZXhiRHNEZlFNUThrMnk0VkFrTWNwbFBr?=
 =?utf-8?B?ZDdFRzYvcmk0YUI4WjRHaEdaUkEycU5kN1hkZ0o2MVllalcwS2xqWXN4dXE1?=
 =?utf-8?B?eFlHK2dKZEZMc3F3a2NvWndZUWFWK2RZRXg0akVoZ0dORk5ycll5MTB2Mk8r?=
 =?utf-8?B?bk5GVHBBTGxJUHJpOTJNWjFZVXAxQXNpZkFaRUlBL1NoeDNGWkFuNkVsME42?=
 =?utf-8?B?WVVWWEd2bG9DWFpDeVgyd0tDUnVGbVlUUmZqcU9KWDhHRkpWQ0VsU3dBMHIw?=
 =?utf-8?B?NEdycDVnRit2eUE1OVZ6VmZpSHd0L0VnbVRsMXNMaXFrczZmVk42M0MyazJm?=
 =?utf-8?B?UC9EVzN3VXJLdlpoUW01WnRMNUJRNDFLdzJROFpKbkt6UlROUFp6VnVCa2tv?=
 =?utf-8?B?SnFoOHA1aXAxNmNhcndzVXc4dlR5ZXlhSi9ydVFaL09oL0UvTjJGZGlMWHdy?=
 =?utf-8?B?UDl1UHlINjd4cEJ5Q21QWUtyOWVsMlNsSmVJZGtBR2VKUW5wRURCcjRONmtJ?=
 =?utf-8?B?aTIxYTRmQU5SQVZkSmZaTnlURlpKVE5DeithbTVlYm90WEI1dHgrSTRoamZN?=
 =?utf-8?B?MXNCdDlzU2FOV1dNTnRadGxLQVZIRjViSUlEa1o2djEwR2dOMGtQeGVHdVRa?=
 =?utf-8?B?YjEvRzZ3Rm5mci9RUi9zN1VkRlF2MTZWYnU3ZmRvTC82akpPUFRjcnlwVHpL?=
 =?utf-8?B?VElaUHMzNEdiY2JpMXpOcHYxdFRWSjNyUmNJcE91VTVOSTdrdlJRY2ZjdGV1?=
 =?utf-8?B?eTZzVlU2TkVwek9WYlNKMG9DRTVhNFFyc0xOUElKVXNsaVh1Sk1RVTVmVSsr?=
 =?utf-8?B?NGdYSC9zVHcrb2ZxemJjOXVQNEhPaVUwZjlJM1VEL2thU1dtUy9NL1NRNzE1?=
 =?utf-8?B?Rnh1OE5pdTV2a0FxSzcraThucUs2K0FHS0JkS2ZaZldBcHZXSWNUZ1ZzY25W?=
 =?utf-8?B?ZlB2cmlDTk9UaEhUQzRJSklZbXI2b2MvZUNOZlNiK3ozR2lENWs5TUt3Q0tk?=
 =?utf-8?B?djBkZU9rbHhJUXpuVmxocDhCeGJReFVuUGxqM3RHWXFseG1WMDBBT2JLMWVN?=
 =?utf-8?B?ZmM3OEdGRHhoYTRITTRxUXNKRzZLVXYwZFNyeXRZdEVqUUt4K3BhamFGSEw2?=
 =?utf-8?B?WXYxK3Y1Sm8zVDVUWEl5YzJqYzIyeEtha3ZyZ0p6NGF5TGZWSnRpemQ0alAv?=
 =?utf-8?B?WUtSZkViTmJtR1RwenduV2N6dXFsbTN0VjN0dUxRNUpZUzdlb0JqY1NJNDJP?=
 =?utf-8?B?d0c4RzEyOHV6QUlvUlZXK1hEL3h1VjRpdFZXVml5Smo4QVRwNm4rUCtGdXk0?=
 =?utf-8?B?ZGhYRk11YmFVSnVGVFp0K2szUHU1bGtYbUlTejI5VzRoWitYYXovY0NyWDEx?=
 =?utf-8?Q?cFVuknCcdZuij7XAqBggdbXIJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8e283ec-aa9e-41ef-cf56-08dba7fbab84
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6095.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 19:19:16.1354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AcA+9Z9gTIUpj7L0C2xMhXCVM99rMCIrwQejkzbAi3HZPeIjNDlZuKi98eg0pruyfrusmTzyxmVyt4Ul6Vh/+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6637

On 8/28/2023 09:40, Benjamin Tissoires wrote:
> On Mon, Aug 28, 2023 at 4:38 PM Mario Limonciello
> <mario.limonciello@amd.com> wrote:
>>
>> On 8/28/2023 06:47, Hamza Mahfooz wrote:
>>> On 8/28/23 07:12, Josh Boyer wrote:
>>>> On Fri, Aug 25, 2023 at 4:20 PM Hamza Mahfooz <hamza.mahfooz@amd.com>
>>>> wrote:
>>>>>
>>>>> The following changes since commit
>>>>> a33f8f1abd1df344798188807de4b4397d7484d3:
>>>>>
>>>>>     amdgpu: update DMCUB to 0.0.181.0 for various AMDGPU ASICs
>>>>> (2023-08-25 15:25:00 -0400)
>>>>>
>>>>> are available in the Git repository at:
>>>>>
>>>>>     git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2023-08-25
>>>>
>>>> Does this replace Wayne Lin's pull request for tags/amd-2023-08-18?
>>>
>>> No, that is updating a different ASIC's fw. So, it's still needed.
>>
>> But in this case the tags are sequential and from the same branch.  So I
>> think pulling the newer one will be sufficient.
>>
>>>
>>>>
>>>> I can't get to gitlab.freedesktop.org at all right now, so I can't
>>>> pull either.
>>
>> +bentiss
>>
>> Presumably you're aware FDO gitlab is down already, right?
> 
> 
> Yes, I am well aware:
> 
> https://floss.social/@XOrgFoundation/110966947933348638
> 
> (and I'm actively working on it)
> 
> Cheers,
> Benjamin
> 
And it looks like it's alive again, thanks!

Josh, you should be able to pull these tags now.

