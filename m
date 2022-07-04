Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEEFC433EF
	for <linux-firmware@archiver.kernel.org>; Mon,  4 Jul 2022 16:39:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 489A8C341CF; Mon,  4 Jul 2022 16:39:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33B38C341CB
	for <linux-firmware@kernel.org>; Mon,  4 Jul 2022 16:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656952783;
	bh=EgztabhSLjIM81Tkg/WI4QgenT23eq9SRl/hTLCtVWE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Oogh7mehUpvTsgd3jZqgU2Dzsh4h+91U/CZvha7tDZi9TuwxN5LDKdj5OqB6CiX6D
	 xD3mD6874uDKBx0iJ9Bi7d4DiCzwQSUYE8rf54Dvon6LInc80AEzW1rDGKpTMCkbI8
	 5LV6BLlv0fomduuvfU9g7ouj78+6EjepctLEqEdPelPxv8k9NFtlZlfjPv4eQu9OgH
	 xhPH7mzWBnZ4MzndBgBZ9ecOkJgGNkOlgC+ZQexeDqg+bAVIEtPzEALqnYURmWRQxJ
	 kp2m+Fe35HUMjKuFF969vDrSzevTL3kk9Dxsbpx/8xaKA/zBcvjSsx+5171Q/UDyNP
	 qCuJQqD1ZbHAQ==
Received: by mail-io1-f50.google.com with SMTP id z191so9063116iof.6
        for <linux-firmware@kernel.org>; Mon, 04 Jul 2022 09:39:43 -0700 (PDT)
X-Gm-Message-State: AJIora9x/YlmWqDAxW4A1LuPxKfxuaJfoOTZS5ctr0g4uul/bzLMYOew
	8tOefZWFd9oxl4B6mUW0dPjtqGf1qTzZYWyJAbA=
X-Google-Smtp-Source: AGRyM1v7ZGD77sO4ouHzWu7XnFlpLMmruO6O/zllpU4nTwu4KyX1kQvTLMWy+wtxsGv3E5frI7FjDY9+mgijZ14w/s4=
X-Received: by 2002:a5d:9ac4:0:b0:674:fca5:62db with SMTP id
 x4-20020a5d9ac4000000b00674fca562dbmr15582813ion.177.1656952782293; Mon, 04
 Jul 2022 09:39:42 -0700 (PDT)
MIME-Version: 1.0
References: <MN0PR12MB6101F96C9F2A202FB9946DC8E2BB9@MN0PR12MB6101.namprd12.prod.outlook.com>
In-Reply-To: <MN0PR12MB6101F96C9F2A202FB9946DC8E2BB9@MN0PR12MB6101.namprd12.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 4 Jul 2022 12:39:31 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4id7+VqBmAhQWi8w1LWms_8CtU8HFz5azEmpWQQyyF-g@mail.gmail.com>
Message-ID: <CA+5PVA4id7+VqBmAhQWi8w1LWms_8CtU8HFz5azEmpWQQyyF-g@mail.gmail.com>
Subject: Re: Yellow Carp DMCUB firmware update
To: "Limonciello, Mario" <Mario.Limonciello@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Gong, Richard" <Richard.Gong@amd.com>, 
	"Abramov, Slava" <Slava.Abramov@amd.com>, Linux Firmware <linux-firmware@kernel.org>, 
	"Tsao, Anson" <anson.tsao@amd.com>
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.

josh

On Wed, Jun 29, 2022 at 11:36 AM Limonciello, Mario
<Mario.Limonciello@amd.com> wrote:
>
> [Public]
>
>
> Hi Josh,
>
>
>
> We have an updated DMCUB firmware ready for Yellow Carp.
>
> Please apply at your convenience.
>
>
>
> Thanks!
