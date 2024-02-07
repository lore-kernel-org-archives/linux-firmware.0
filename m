Return-Path: <SRS0=o2Ay=JQ=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 395FBC4828D
	for <linux-firmware@archiver.kernel.org>; Wed,  7 Feb 2024 21:35:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 23332C433F1; Wed,  7 Feb 2024 21:35:43 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2067.outbound.protection.outlook.com [40.107.94.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EE820C433C7;
	Wed,  7 Feb 2024 21:35:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EE820C433C7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yel3QT2R/FOqfecLmKU/SMfO1BNAtE/hxi9n08cyIb1Hrqf10EDyzYfscHt9D9kZ3Svru2tulaDyE84hVG91WXyGFdD6oVv6lN2eAySXd5+9K/8g+jsSIQLfj4iQ7/5pBgTbauFaUcAiQZxyU457YfStoeqLMGkcZKqSKeZ4v4QOntjm41QvM7ffyurDygEMnz5Jf5QtqgrklPSbGoD7WcTXIrTb7IdBDx2sDG7Wl3bWOk/qnWLXMf82SZF31OTqQJ1Tf3AiiHN0ueYVCMkpTTFw/26SsboJUWOSJSfLdqH937BCp8y3GdrTgr3+0tfqLzqD2Tvr5t7HeBQJtQoIjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HAKwOslf62QZn4J+6kVd/fGj1rP+nI+I1t+WJzD1K1s=;
 b=lddR5FL9qftWiBC9wJ7wksplv6AojNc1YpqmwCSVhFimsTCNlQ9RguJBCrkvL5Sq558jwX/+vpOxi8r2u0HOLETVx3XHgoVHKX9nbk8ysKP0F6UvbZNXqbloYzFR4p1XLVw5RYdQNcc1RnYg6kLHk1JKwtRGvzca6HbdrTeacv7DW9CJTYNFo8CChMFHP28rNm6DItuf4yDNCtKERN16PH11uiM2Ts1WNuzpuEWybN0HhqNedsC1OaO8T2MO/wiWkixoATpB+R8lBJyyd7ui8ugmPFzFW04Xyo6a8Q2w4dJZP4OUypmDTbnHbx4JrUyDvfHTt06XfVk33PJnVU8Akw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HAKwOslf62QZn4J+6kVd/fGj1rP+nI+I1t+WJzD1K1s=;
 b=qvaOu5NPyJ4SeYVLhue2SIfSbQmhVvtNuN9ahALC5eGKWqH85Yh1Rw1rdMMrVJTlr8f/fzZv/0vyk241DZfIaUaFX/zWiIHr6KT54aE8XbS9yRdhu5GdhQqnFBuXe3NgMB4BZhfHS8+Is0xwHtGsW1Pvz8UGqB44Lxb8adHLkOM=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA1PR12MB8841.namprd12.prod.outlook.com (2603:10b6:806:376::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.14; Wed, 7 Feb
 2024 21:35:38 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f6d2:541d:5eda:d826]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f6d2:541d:5eda:d826%5]) with mapi id 15.20.7270.016; Wed, 7 Feb 2024
 21:35:38 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>, Josh Boyer
	<jwboyer@kernel.org>, "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Sharma, Deepak"
	<Deepak.Sharma@amd.com>
Subject: RE: pull request: amdgpu: update DMCUB firmware to v0.0.204.0
Thread-Topic: pull request: amdgpu: update DMCUB firmware to v0.0.204.0
Thread-Index: AQHaWgjCx4RaTPm2p0uHwe9P8HuCMbD/Zw4Q
Date: Wed, 7 Feb 2024 21:35:38 +0000
Message-ID:
 <MN0PR12MB6101CDB409E4F02704FA53A4E2452@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <20240207210056.1610158-1-aurabindo.pillai@amd.com>
In-Reply-To: <20240207210056.1610158-1-aurabindo.pillai@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=a31b9f07-be96-4944-bd29-ca446095cd8d;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2024-02-07T21:35:25Z;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|SA1PR12MB8841:EE_
x-ms-office365-filtering-correlation-id: 8abe445d-7af3-47df-6df5-08dc2824ba21
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 bOt9xxNr0/gzziJnpRftU9ZQbZ7w9gvmGrLNCpQM6hivpWaIfyOvhZB1dlfh5UVXhANa7BjziE5nvTxVBJyI1ECzbrj3qmljQBdWc721MMcVvB0b2/onSqD/T+0e38aa6N72shH32V4dpY2Y0ttCHCVFioz6ZST7L8aP4DUNwhYEspbbGeUttJIzJp4Yz0bv51h4PlE4IQx33t7KNcsmyqlHJHcw4Phjvh1dj4kfxlnANF+8dzhYI7Xy5nPHsFZC7YomP5Af/LXhNkWW36+Fmvw8BLRvQnsL5pdQVIDWz3Ngye+K3FV+KdLFgSq8YQH+PR1tIInavYdLkphzkRmI/4XX6KuQrwmCDMnb8wGUcG+cPdmG/Qn41TgoxVkZJ5zfciRpO4p2qYUdD2yGtEoXwVjeC5emmW1OPzdMsS53TUL+DVGGydrmCyEeqAAncF/BznrxUz8vgLS8mdiLlvSgLnz+YNDW9A+psikgFL+zGmT4z6ivdUe3u8V4IUfvo/V07RuLyF78nhV/a6vafnhRGyV9tAjjEdYeMWX1yL6tkzoomhuBKb8gIjAo5VsLEMZOWLPH3Kiy7JI45FNc5IEiZ13zU7MF05mAmQTd0fchitgtIVn0ztXTgv+ryuUssZdx
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(39860400002)(366004)(376002)(136003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(55016003)(110136005)(83380400001)(316002)(71200400001)(2906002)(66556008)(122000001)(450100002)(66946007)(54906003)(26005)(6506007)(7696005)(64756008)(86362001)(53546011)(33656002)(15650500001)(8676002)(76116006)(66446008)(38100700002)(52536014)(8936002)(66476007)(38070700009)(5660300002)(41300700001)(9686003)(478600001)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?9keyIxKaj0DoOalrgFqyNkXCx+J9H9971igF/9qX3kBQlilqHWavAaiG9ItJ?=
 =?us-ascii?Q?yT/NK3CTzMJ1MpI0tQCvmxApnao/WYBjZp9ZVIydfLeXpYm65BQY/xJaZg+Q?=
 =?us-ascii?Q?mrTQux9Na/4Z5nnADOTh4pIwRZbj/dPIo4HiABlXjCHce3Ct9my4uaw7kZBt?=
 =?us-ascii?Q?eDhIfrCEf67d4UKFiTXCR2ELn/pfKqEb3mtf1vY9KHEYAe9WA0Nx6MDr7Pr4?=
 =?us-ascii?Q?EZm0eZXtX+zenFXCYKskva4JcPp8S/NaDUrNdNfMjwBU5ZyQZgo4ngg67mju?=
 =?us-ascii?Q?336Hul8QZbHGnrxYOkrjPySq+uGYwTkSsaGZcDW49gjeDmFkkxfGQIqpRr1/?=
 =?us-ascii?Q?Nc0svQU6c/ec/V5VOO5rpHy7251JuQzRww3FCw8PoCGBy1YjQmXevMEiLX1c?=
 =?us-ascii?Q?n2td3nFXJnu/rY1PgZrouOnY9UZ7hZ9usdjIBvKGToz9UFtYSqE42OaOj/dd?=
 =?us-ascii?Q?pVmYbfocj7/kwe0mlHyhn9wdfz4t5caBGtAFEac2ey0qnUrE9Ta0gzbNWLR8?=
 =?us-ascii?Q?hnjbMRzxbImEV4oI428jK6jCz3s4TH4yuL1d1F3RHZxr7maM8GEeXjmZavkO?=
 =?us-ascii?Q?teoeaeYZEdva6kyI9Rvx50UJ2uYPjebK0ndlCG6c3xA7vZxqAZIpgfHBklLc?=
 =?us-ascii?Q?9a9OvFb20cTVRXMGX3jlwQ2tydmpltXVo5HILxghXphWsjlxmjT2nWaAi/hY?=
 =?us-ascii?Q?1pdA4kye32e6mlVuXAspIT5IC3ye6++/bVL4hcpPJ2j2JG6opCvbqg9kSZ4I?=
 =?us-ascii?Q?N5AVPFV0LENc6q4yzF6NAMbTPHe5mQ9l9EP6BG+dAqBHH9P/TeZ8b0I0ltaf?=
 =?us-ascii?Q?3Pq6KsbsGSPbTh/36+26DPVXmYk2kkn7CLwNepEntI/FbQVYeuhmnuBcTPtg?=
 =?us-ascii?Q?0zUtDPhU87DSlUXicpRJ7XkKmdsHVMACS1JY8Ig0lx0AoS/H1Z7fluYo9C4n?=
 =?us-ascii?Q?eQHJ8QFlU6JxR8B9cK1USXuQZEpGF4YUYr2j20iGLPsHft32nROugfINii5n?=
 =?us-ascii?Q?DgFCaaEriEyJ1D91ton9DtvlM7rLH0f/BV1rLhgTWn22srimbqNGrGclowl8?=
 =?us-ascii?Q?Jl9ugvSFt5ZNJvphbesfwatyyYEH5RfFU4+Gtk5dlq2xcoqtflGqOE/kW5cE?=
 =?us-ascii?Q?8JzPIQlhrpsmwBC6PKDjRWU/kc+PSOdHmPq+2qRUe/qCW2Nj2k5vPd1HndmA?=
 =?us-ascii?Q?6vqEWM0wx9qeJbBAl3vOy/CV5JDmTTV+XwJvGFuaNM4lrV80N5w6pFD3t8Fu?=
 =?us-ascii?Q?Qpmf1DE87U2TJ5xcI+nfn96OuwHdVmu9KgWFVHXAxQEvXpn+rJ7jUW1Uayn/?=
 =?us-ascii?Q?5DYHW1Pd/aZCupOl3rELwTv21NpMVcILirM2PqELCqiKwU2nWfZ6K1agTnXi?=
 =?us-ascii?Q?1daL4tx6FGA6lnvp8n/qKKIRxXPJZ3/9vIR7Yyrugj0DkuqrqUEfjukuey+o?=
 =?us-ascii?Q?LnMCdlAKZGScQtXUGrATppK6+UHAIJurlzlJ3BIo02/YIbBmNQ09kJd6Ufzc?=
 =?us-ascii?Q?x/8/5ggLZB/CGSoyDYJty+Z5eBxWs2yKB++xd47yT3UN8I94Mmz1M1MzP81x?=
 =?us-ascii?Q?tc3TWhjLC6tbV/FMoMk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8abe445d-7af3-47df-6df5-08dc2824ba21
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2024 21:35:38.6353
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2EZX8c+lM74jh4y7LtHv2DTSfYLHJNUpxQkWQ83FJm8iRTOFvEY9MibImD8yUeuIRsfl3qi6l33bxEqlrQSfog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8841

[AMD Official Use Only - General]

> -----Original Message-----
> From: Aurabindo Pillai <aurabindo.pillai@amd.com>
> Sent: Wednesday, February 7, 2024 15:01
> To: Josh Boyer <jwboyer@kernel.org>; linux-firmware@kernel.org
> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Limonciello, Mario
> <Mario.Limonciello@amd.com>; Sharma, Deepak
> <Deepak.Sharma@amd.com>
> Subject: pull request: amdgpu: update DMCUB firmware to v0.0.204.0
>
> The following changes since commit
> bd2ad5e65d3bc38fc35eed8c3dbb5e40ae45df20:
>
>   amdgpu: update DMCUB to v0.0.203.0 for DCN314 and DCN32 (2024-02-
> 02 16:58:17 -0500)
>
> are available in the Git repository at:
>
>   git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2024-02-07
>
> for you to fetch changes up to
> 914ac3d1a0881098fa7f091b2f7bd848544c44e8:
>
>   amdgpu: DMCUB Updates for DCN321: 7.0.38.0 (2024-02-07 15:55:39 -
> 0500)
>
> ----------------------------------------------------------------
> Aurabindo Pillai (2):
>       amdgpu: DMCUB updates for Yellow Carp: 4.0.68.0
>       amdgpu: DMCUB Updates for DCN321: 7.0.38.0
>
>  dcn_3_2_1_dmcub.bin   | Bin 0 -> 232224 bytes
>  yellow_carp_dmcub.bin | Bin 0 -> 234768 bytes
>  2 files changed, 0 insertions(+), 0 deletions(-)
>  create mode 100644 dcn_3_2_1_dmcub.bin
>  create mode 100644 yellow_carp_dmcub.bin
>
> diff --git a/dcn_3_2_1_dmcub.bin b/dcn_3_2_1_dmcub.bin
> new file mode 100644
> index 00000000..e463012b
> Binary files /dev/null and b/dcn_3_2_1_dmcub.bin differ
> diff --git a/yellow_carp_dmcub.bin b/yellow_carp_dmcub.bin
> new file mode 100644
> index 00000000..5b634a72
> Binary files /dev/null and b/yellow_carp_dmcub.bin differ

Ignored in favor of the fixed v2.
