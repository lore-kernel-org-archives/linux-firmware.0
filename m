Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 836E5C54EBC
	for <linux-firmware@archiver.kernel.org>; Tue, 10 Jan 2023 15:09:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4EA03C433F1; Tue, 10 Jan 2023 15:09:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38847C433F0
	for <linux-firmware@kernel.org>; Tue, 10 Jan 2023 15:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673363363;
	bh=TTcZgfCr8H2575JrCjxfgiG8Y4xp3edg8dvq5nVpUkg=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=s0dn6kjQGmo7J1YhqsMHAtxHxUoqNdJJFFF3fPkjOXCZ3zsK3wJeqVA7MCo8I0oLl
	 L2GP/brmUOwHiSGR5GJxEkDqkvI7XHiYfvCir3MZ4Xi9r/QVoTcWAbOZi9UhjWM0l2
	 SXHZUkTXzMJm4J3rtEi1Hv+MxHTUh4vsGjXFpmpuSW8IgfwZzyaTlI+pMh3XvVTTnJ
	 RNrkKZjyD1H5BQDd/GsuT7NA1FyBtH44qZn2EqegurOC4cVTOYZZtf8g8ACPZX09eU
	 A36Ddrs7CxzfbqOVA/Y91S2Gw5Ay+y0AFNTkKro4wkoexK+0zoBwba6J7Jd5q1Epto
	 W56NY1tM0/yBQ==
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-4d13cb4bbffso37300917b3.3
        for <linux-firmware@kernel.org>; Tue, 10 Jan 2023 07:09:23 -0800 (PST)
X-Gm-Message-State: AFqh2kr+QmUXnmV6CIbUAJJeIwU6R01Kfg494V7GMxTf3BBIJ8TYOAed
	w2IW4LVEYnyA9ieMwsl3ByMgr+nPDnuISb9G+kg=
X-Google-Smtp-Source: AMrXdXsPvz7/L3fnkICHefserF4Bs32650kYzK/j8Pbr1tRXeQ6iEvLrYsToyeB6eLRFSNsdSKIE09py9OW38gaaIOQ=
X-Received: by 2002:a81:5542:0:b0:3e7:c742:f827 with SMTP id
 j63-20020a815542000000b003e7c742f827mr2429524ywb.91.1673363362234; Tue, 10
 Jan 2023 07:09:22 -0800 (PST)
MIME-Version: 1.0
References: <CADnq5_PgsVoFiqsiK-qwLFA0e4AZ_S2MjWhj9RtQzcFpjug8MQ@mail.gmail.com>
In-Reply-To: <CADnq5_PgsVoFiqsiK-qwLFA0e4AZ_S2MjWhj9RtQzcFpjug8MQ@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 10 Jan 2023 10:09:11 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4Yuow6eLp6E97yh5K==rkaBLxVbiP05v26jEiNv__MxQ@mail.gmail.com>
Message-ID: <CA+5PVA4Yuow6eLp6E97yh5K==rkaBLxVbiP05v26jEiNv__MxQ@mail.gmail.com>
Subject: Re: Updated amdgpu firmware from amd-5.4
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	"Limonciello, Mario" <Mario.Limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"

All applied and pushed out.  Thanks.

josh

On Tue, Jan 10, 2023 at 10:05 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Please apply.
>
> Thanks,
>
> Alex
