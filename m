Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24BF5C433EF
	for <linux-firmware@archiver.kernel.org>; Thu, 16 Dec 2021 14:38:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 10006C36AE7; Thu, 16 Dec 2021 14:38:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEF7EC36AE0
	for <linux-firmware@kernel.org>; Thu, 16 Dec 2021 14:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639665498;
	bh=VbgHFmAhXAKS2ZBftdDzTH1uzci7cYS5VDI0AFdMMXI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ejvD++Bt3pL4ZpX8TRVqF8j/gtpUmYi/3X+WDR44XxY0mDpdai9KIpXnUwsF3kKSM
	 5RN1BsgJlNiqzH58EJLqbqbcUWL5O4iHKGdcSKu310o3W7Yjk3VktOpS+mNuX9Y4JA
	 BBjCX85z0qNMJPX9hK2a+jZOzxVH3/VXgG+tyEete5HN35EIGB+lIeXXXVUYA3y1qv
	 9X+br466YLOArLYeT68cpMaShOWTV3mbZR1EKg04c1Ir+lvsr+XMRhcD2UgOUrAN11
	 YqITbhFauzz3tgF5zBTJzRFECJhXMXS8qKfYYel+5mFgg6rRwjjyMoMpsYzfrdZq6f
	 RRROmt3RL0hPw==
Received: by mail-il1-f169.google.com with SMTP id d14so19866431ila.1
        for <linux-firmware@kernel.org>; Thu, 16 Dec 2021 06:38:17 -0800 (PST)
X-Gm-Message-State: AOAM530sem2iOW27j+s/ueSUo7c0bf9Z7lDGR/6r79eoh0WtlHVaL1ub
	9DuglRDVEoEwIMLr2rEfx2Ah+nUeuvyuzLOrJoc=
X-Google-Smtp-Source: ABdhPJxlHXdeXnNkOvJQo3ylhDSpVJ/EPO8wJCbZS9YwXigHUfYDTO2uk8XgN97aUHzIHx2pW7F/7Je50YAIt1oKP2U=
X-Received: by 2002:a05:6e02:1705:: with SMTP id u5mr10009811ill.97.1639665496761;
 Thu, 16 Dec 2021 06:38:16 -0800 (PST)
MIME-Version: 1.0
References: <CADnq5_MNip9skvZV+ptyk67OV_bWBH4obtg2XSfEe3_4T1Ni2g@mail.gmail.com>
In-Reply-To: <CADnq5_MNip9skvZV+ptyk67OV_bWBH4obtg2XSfEe3_4T1Ni2g@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 16 Dec 2021 09:38:05 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6DVN6d=6wN8oDMgYjS3AvJsc3+W3Q-pyOdV89M4FTEVw@mail.gmail.com>
Message-ID: <CA+5PVA6DVN6d=6wN8oDMgYjS3AvJsc3+W3Q-pyOdV89M4FTEVw@mail.gmail.com>
Subject: Re: amdgpu: update green sardine PSP firmware
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, praful.swarnakar@amd.com
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.

josh

On Wed, Dec 15, 2021 at 1:53 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Hi!
>
> Updated PSP firmware for green sardine.  Please apply!
>
> Thanks,
>
> Alex
