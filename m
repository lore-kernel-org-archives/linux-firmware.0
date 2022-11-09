Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECAD2C433FE
	for <linux-firmware@archiver.kernel.org>; Wed,  9 Nov 2022 17:43:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D3E40C43470; Wed,  9 Nov 2022 17:43:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE26EC433B5
	for <linux-firmware@kernel.org>; Wed,  9 Nov 2022 17:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668015838;
	bh=0nUtU6SdNtlh4mbwHrsjYfFk8iB3BUGyy0uzeA/y5w8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=PnQv3X6aemA2vt7Se7c9j4tLspNFcWeEAMhpbrOW4JzPoLUKlDaxOmoENB7zlNo9j
	 e9/yW9NBI2rJ/a2HM/qFrQc1BzSkVRMDqvuPQep8JH0s+payp8qS5Lu2A7FQWuIi3+
	 DsGqIqAkqSt5QmEGdIskFZBUs9Qb0dFNM76dOZN7TFanb1y+l6FjrQqN1vgF68ZGv4
	 iBEONFOEWwQB0dlYElKtd+iE0kf8z0hHkqaPzWEDtoMnlbwiAHWnD/tKRLrQLLfWgA
	 UEeWbOPrZVIJSqgEpVhsh56COgCDByjnn143xSVNWeZb28qfmEOIgz3cOOCoOFeGwZ
	 oy+udsNr4Vs2Q==
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-13c569e5ff5so20446594fac.6
        for <linux-firmware@kernel.org>; Wed, 09 Nov 2022 09:43:58 -0800 (PST)
X-Gm-Message-State: ACrzQf06hZMoeb+9lb/5BqxupOQaAJpd7S3pplPnQuvBOdDaw3KM5HFv
	A4AvLxuSj0zntUQzexBNf7h8OIK6/3tX4l6LLkY=
X-Google-Smtp-Source: AMsMyM5DlY3QddjPlH7X9iHq25x9X488kMGs0gsyvf4AVlgqWfTOB90SruD9XTISMsBF308C77jm+JnBoAbmAmF5l48=
X-Received: by 2002:a05:6871:723:b0:13b:f919:3146 with SMTP id
 f35-20020a056871072300b0013bf9193146mr37094148oap.267.1668015837821; Wed, 09
 Nov 2022 09:43:57 -0800 (PST)
MIME-Version: 1.0
References: <CADnq5_ObQP_7VrmVtQX5fqdguVf62DDey+sbWEZxc-YWKY-7sg@mail.gmail.com>
In-Reply-To: <CADnq5_ObQP_7VrmVtQX5fqdguVf62DDey+sbWEZxc-YWKY-7sg@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 9 Nov 2022 12:43:47 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5TR2mdVctZDopG9sV8zgvaKPsJvL9iL_mOTZMCFjiXQA@mail.gmail.com>
Message-ID: <CA+5PVA5TR2mdVctZDopG9sV8zgvaKPsJvL9iL_mOTZMCFjiXQA@mail.gmail.com>
Subject: Re: Updated amdgpu firmware
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	"Limonciello, Mario" <Mario.Limonciello@amd.com>, 
	Chandan Vurdigere Nataraj <chandan.vurdigerenataraj@amd.com>
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.

josh

On Wed, Nov 2, 2022 at 4:10 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Updated DMCUB firmware for DCN 3.1.6.  Please apply!
>
> Thanks,
>
> Alex
