Return-Path: <SRS0=f9n+=HL=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ABA5C982D7
	for <linux-firmware@archiver.kernel.org>; Sat, 19 Sep 2026 16:46:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5B7231F00893; Sat, 19 Sep 2026 16:46:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.63
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1789836374;
	b=VEDNU4YEXMMQb13VIVG2ETKRiOJcYrsgXB8nopT5c/u7VEC5maGYOdaFEyFMMkBWy726
	 j1K7VSm3O5crzKWQBUh5YKbLva2GyZowOsP2YNsV66F9aUcM/XEHp9LdC89jkhOqVVctp
	 DEvl7xOPUnjm7f2SH3LvkiaUSNOjkMZBdZxZzJrvrvEG53UPr3H/obUOkbHfObsokIFAn
	 9xHciaIA/VhrSK2APV5zHOZh+pG1ukUYIpMDyjM6jVBAwZg1GGhrONJxdqWODoMcOFXK1
	 fPdzD/qt1flAHFpBk39SjPrCV+AsnlNe5Gqd7BQvg3gtINKd1fly9asPorTQRm9HQTw==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1789836374;
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
	bh=NvWBIK8hHpSSZ4Dhv13RQUgzIRsCOxcfGfC9EesC3j8=;
	b=wzphFPCP3penfcogtYEt8JJqGw8IMeJb55NTK4SjTlT+WvyoqTxc/IP3pu2meYAso93e
	 iXZedB8jAEkM5jpz071skXhUqgD+4W4nVPvZVkwvDdiTQIufvYT+nYQ8G30kCTjjD3R2M
	 un/nZxke4j9hVJjqrOzpZOkf1PO0+S0txHa2fRJ7Y7KrriWgfqn0fl7n/pwz+xtwz5rhk
	 1OlIRCJkO4bdIcgrVa4COqFKEoCvDbEK31cdkxVodJMcj0xLQ5fIXI67W0MijEey52J6Y
	 LMsxpHqCrNLiQrlBlh8a4xffeGVaLXXjHb3J9tScWKiRMSQcSrHsi2Q/pJXArIq7ltA==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=EvFBpBoK;
	dmarc=fail header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.63
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012063.outbound.protection.outlook.com [40.107.209.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 78E661F000FF
	for <linux-firmware@kernel.org>; Sat, 19 Sep 2026 16:46:13 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=EvFBpBoK
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 78E661F000FF
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nYBHc4ow9pA+x0shrrl8iEawtvRm6tPUsBZIslALNEBxkuZdVkhhS2LeB65Y5rWCikmO1DhFByF2DR1YO+lGTGax447vcxwkroNWzGsEccsVXspZEu/P5R3mQ+TkTrLFWmcQxIXCk3M+gIqxTHCA1TRNavfzoYs5Xy+7MD7m+L+Hae4ZGh7lR6FWPjvVV4J+EFwP/FAqZem64Vnu3AK4QM3zsUX6JudTtgUWHRwkaVt91oHd5t2ZWfRuXC5jTJrPhPBJKkvUqnSrBksWRWZsrAN2lYMKH3CUxbuGqMVALLVSi9sIqE2294MCHmzbJkBLmxzDeXokv+zz6BUzP9hkEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NvWBIK8hHpSSZ4Dhv13RQUgzIRsCOxcfGfC9EesC3j8=;
 b=wmXTzFrhJHS9sfJxcT6tFw+x5YT8Ly2KOpntoSt9821r8CyJ0TpFuPw/zx4vgruM9gxSJEzIelPOsruNbxfrPtw++DzBsF6Gqkp0QzKvQg9jP2tvRM88h9T9cRWr+dNYZ4b5Jbhf2W9Wc3MmPc2m+PupyddKbemGBB0MKPAww7UjH71mZgAy57kPu9Lqtqb3E2KeSRLo0TjPFgMiue1woLo10CSzIPB0SM4blaKHJZb0TIEZ0YEUF9lHc4qqixG68p75WllByfz4HJZ5Cv3a6laBX9QvSL7hQvDlzPCtSHSUNAfZQsrlxvOo4xQ2uigwqatptoC8qLTDPQYYN5W3Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NvWBIK8hHpSSZ4Dhv13RQUgzIRsCOxcfGfC9EesC3j8=;
 b=EvFBpBoKyPrhDDJq2kqjiyxIx9DN7IHClBjRb/jVMjz4VR5EGCizPR6VoRhy2OjJPyVING6704pd/Q3YpZMn3ahn+AdcflsWdmodi+8Q9wjWp5e09buW2O/nxCqFHibmFAyvV30d+5z/ankSC3eEQfQPYQ/MNEm1NX5zK51LWvI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by DS4PR12MB9771.namprd12.prod.outlook.com (2603:10b6:8:29b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Sat, 19 Sep
 2026 16:46:09 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%7]) with mapi id 15.21.0428.011; Sat, 19 Sep 2026
 16:46:09 +0000
Message-ID: <ec8b6377-d2e9-4bff-9565-a39234167afd@amd.com>
Date: Sat, 19 Sep 2026 11:46:07 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [pull] amdgpu firmware update
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>, linux-firmware@kernel.org
References: <20260918224606.959586-1-alexander.deucher@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260918224606.959586-1-alexander.deucher@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::26) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|DS4PR12MB9771:EE_
X-MS-Office365-Filtering-Correlation-Id: c70e5d92-5b72-4bde-6ac7-08df166d819b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|18002099003|10067099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	v5dJCATZXTelcls8UOBxmMOdAW7cgyw5EaA39RlxqOxiVCai26f4eThKQ+9zvNWH0fz9mH0TcChEE50OkCTD9CuS0n36CeoF9aicSYX1tCQoWFew0oSqf4K4gi6zIwsAL9atJ/8CjZ+dMyOHnI3xySrMDJzM5sQXvYi4uJYmTsKeQym1/medhwupe2dLOhxdyqT7rB7VP1Sd5keMHW/PnsHf7QnPlQ3V+kaXlpWM2qAY3s90obfXNZ6Cs7/Pg4VE/aSckaeE2/lJIizCdZDwEOl/DadUgMAymHZZqKqGFU/fNWo5nJd5+C0gHVnYuv8e3vYhQJ2at1XWQqHLyTmimUOFtnV20DurYKOH5Pds6Y6arxRnd/wD331Cr+CwUquxNGoN7FFVY9BcEvfjKiJipNmWpEt1E5sK7i2pFE5FVqfVYNq7mADCcoJ8C7RVi0wh/SKvgTvk02ZmvHhLQhrM3A9J/MXrClIyx0eF7hF1D1Q0FoVp7Um7lsMsrs53jMK0QF0vOGRr597HoPgcpL0zw6Kp2S94XvTa+WTaW65h4/wPKIZUIyvGGnNsRUbzTBLsUnJtKLugL0fWqL/NYRW/++INOmyRCirAOefim8j5Xmc8R+XQ9Klh2Or5x2Xub6h2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(18002099003)(10067099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eldRcWMrcW1PZXRUczJReVM5U0dXRVNDUjI3MnMxdG85dG1vcVEvY3owY1Z6?=
 =?utf-8?B?a012d0IwaG0yL2JyUnBJMUJRcU1aaUoxWnJVbzlhL1hUZXA1b1dtL2RNN3RI?=
 =?utf-8?B?c3lKQVJhNzdLTVEvNm4vRjVvTVhidVVXZWVmc1pXR0VwaUdUeEw2alY1WXdv?=
 =?utf-8?B?SVJIQlAvUi81Ym9sNEU0bi9sRDB2NVZWSlN3UmVtSlBBaGFpeHFDanZkVCtG?=
 =?utf-8?B?TkpRdTNwdlNlWlVCckw0ZEtEUTNUa0Z2RmFCK2s3TkYxWWZ2YzVmUzVjUVlR?=
 =?utf-8?B?QWxPUVRjTjArVngvbjNEcm4veWdwVi8rYjdOWDlDNHNkSGJHR3I3Um5PVFE1?=
 =?utf-8?B?ejc4VmgvWDMva1VFUWFLdzRPTEFoTTVPSFR6b1hrdERFNzRFcm8vWWNkbzVv?=
 =?utf-8?B?azBnWmtJUjhqMkdVcElQMm5EV3lkT3AyTkJaUFlCUWNwd3Y5Z2RuNndtMzZu?=
 =?utf-8?B?bzRVTWpkSzljdU96dTRETkk4aE5qN3h2cUo0NEgyK2F2Wk5OUVVOMTRTY0dv?=
 =?utf-8?B?Uzc2NEhyeFNsME5nS0RxSmhlSE5jTjdBUURkZVorcExSVUs4OW5TdGpDWGNU?=
 =?utf-8?B?QWl4ODZEaFlNQmVQc3Q1NExNTGRJUHREYnludEpQSUo0WWUvNWczWCtIdXVz?=
 =?utf-8?B?bFZxSFF5L24zZWJtS3ZrODE0V1hsL1I1ZExkU0pSRnpNaHBpRyt5MkZyQTBk?=
 =?utf-8?B?eGtwcFc5ZDN3TVlQcDZQZndkYXJ3cEJmOGRGeUNBcXdPNDlWN2FZUlloMGMr?=
 =?utf-8?B?djhZdElmMm9uelZDeHF2c0VSek9xaURTcUV4RmlMUE5NSVpxeGpOcjAyRGo3?=
 =?utf-8?B?VFFyRnV4NjNoTTA1SjYvMUV1cGRDc2hLUkNJc3ZBREFiUzFvMXRsNW5yNjJk?=
 =?utf-8?B?ZEZLYkdvWVk0WTFLTEpXdGdWZ0JjYmVURVRRQ2ZkUnRiY2ErV1g2bTRkT2Vz?=
 =?utf-8?B?THAvSDVvSVVYSHVETTlrQUEwL1Zza09vV3lJeHNiTWorODI1UGx5TU1UWGYw?=
 =?utf-8?B?eDhFYjltUy85SWZXd0VCaWptMnFrdlNPSzVpUHlGZnBjekZGVWpsUzhxK1Vl?=
 =?utf-8?B?RUlwVDY1NjlyZWYyK0xBb0hmUWdJMEdsWVFXMmZzWXEzUFpZaWtKY2JKZ1VL?=
 =?utf-8?B?NU1ITFg4RXhISVQwU0FmVjdOd2JrQlp4R2lhQlFsS25ETVg3aGxXdkp1OHBv?=
 =?utf-8?B?RWZtZzF6SVdwd1llKzVKZ0FvamtFSExxR2hqYXJxdUNqUU5JNklBbGlzVDdx?=
 =?utf-8?B?QzU3NVlyblpDVmJKbm9aSjBWZWlJcTlIdDFCbGRWd2ljRzVuSWdCdmZFRnNt?=
 =?utf-8?B?dDZNWnlFUWEybkpRQXBMTUZyb0tXUE5DV3BFWlVhTE14emtmN3BnK2lyV2FR?=
 =?utf-8?B?MWIwQ3BFeTNUTHQ3TEpKcS9IUXE3ZEthc2RmQnFqQm9QVWR3MnM5ZlQ4UGQ4?=
 =?utf-8?B?Q2xSd21EMjh5VWRDS0ZQL1ViWVR6OGNURm4zVWFUOEx0MCtwVUdxYm1BSWlS?=
 =?utf-8?B?dUYyY0ZkUkxmQWdob0xpUGZnNVpoMTdHM1VWU1BYcEsvSTE0N0tBY2ZpMGtq?=
 =?utf-8?B?dWppMHptZFNKWVlvV0hhQ3dGblpGYjdpNmVtelZZemYxTkZZRUN1L0xJWk9G?=
 =?utf-8?B?RnV5eExCYW5NMVI0dDk0U2k0KzhCei9qZkRJLytaWEoxOUk5OTdWay9vOVI5?=
 =?utf-8?B?NmhrMmt5K2JXaHBpMUNaVmNnRzNZeUZuYWc2VmpuK09nQUoraldHWWo3RE40?=
 =?utf-8?B?OGhOTHNJSVZ0MWRITjkybWNKaFhnYm5PYlkzSDcxTVFIYXVEWUQ1dHR5UUN5?=
 =?utf-8?B?RzdPWWo2T0R6eHUxc2QxQ0tuWWJVankwYzRHbmlyQnVSTFFnYnZTYmJUWXRv?=
 =?utf-8?B?NnVnY0NPMGJwNnJtVk9YUHJKVlkvOW5OZnMyY3g4RzFkdlJ2NVFzQnIzT040?=
 =?utf-8?B?M1NuUVh2K3I4M0RFMjVKU1h6eFpHYkl2UnRSbTNoSHZ5dnptcXNacHhCTmw0?=
 =?utf-8?B?dVZaRFdlbzJYTnNBS25kWGxsQmEvRGM5TlhjNUwyZmdXbi94RnhkS1RSZFlN?=
 =?utf-8?B?RHNDYktWY1hpcWFQM29WNDBLdmd4SUozQktJQ0RrRjJGbFFWOXVQRVNkcm0y?=
 =?utf-8?B?QnlyQkNsZm1WQXpMeXRLcTViR3Z2WWJuS29vZXpxMlpGVUpzUmdlc002Z05M?=
 =?utf-8?B?bjFZWDJLTFkyUldaUXB5STlJNFVETitFMUxHdCtOL3JpVTJZaHdmdWZxODY1?=
 =?utf-8?B?NS9PeXRxcWZUY0VpbDBoc3BZMTJxbHNqTllGeFdsMnJPc0RVbWJCUUgzK1NT?=
 =?utf-8?Q?1xcP90GP3E4gdQxLIM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c70e5d92-5b72-4bde-6ac7-08df166d819b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2026 16:46:09.3457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CLS0rYilnuc+cghzfAaeKTTfnUX935/Tqh6/mZvntGoL5wOKjs9f2eOpsFWqrzBjkC6uQsiYSo3X1nA337HvgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9771



On 9/18/26 17:46, Alex Deucher wrote:
> Hi,
> 
> Revert GC 11.0.0 updates.
> 
> The following changes since commit f5e8adfa1e0c2af7ac13280fdbedfd48f37e0c34:
> 
>    amdgpu: DMCUB updates for various ASICs (2026-09-18 17:49:24 +0000)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/kernel-firmware/drm-firmware.git tags/amd-2026-09-18-2
> 
> for you to fetch changes up to 3d99cd46c54b99843d75ef9da22e89c5a54bb4d0:
> 
>    Revert "amdgpu: update GC 11.0.0 firmware" (2026-09-18 18:37:33 -0400)
> 
> ----------------------------------------------------------------
> amd-2026-09-18-2:
> 
> Revert GC 11.0.0 firmware updates due
> to instability in some games.
> 
> See:
> https://gitlab.freedesktop.org/drm/amd/-/work_items/5711
> 
> ----------------------------------------------------------------
> Alex Deucher (2):
>        Revert "amdgpu: update GC 11.0.0 firmware"
>        Revert "amdgpu: update GC 11.0.0 firmware"
> 
>   amdgpu/gc_11_0_0_me.bin    | Bin 324064 -> 315120 bytes
>   amdgpu/gc_11_0_0_mec.bin   | Bin 406528 -> 406528 bytes
>   amdgpu/gc_11_0_0_mes1.bin  | Bin 221120 -> 220480 bytes
>   amdgpu/gc_11_0_0_mes_2.bin | Bin 263696 -> 260624 bytes
>   amdgpu/gc_11_0_0_pfp.bin   | Bin 234960 -> 232096 bytes
>   5 files changed, 0 insertions(+), 0 deletions(-)

Pulled, thanks.
