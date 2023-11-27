Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A5DC4167B
	for <linux-firmware@archiver.kernel.org>; Mon, 27 Nov 2023 13:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A2F26C433C7; Mon, 27 Nov 2023 13:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 894B9C433C9
	for <linux-firmware@kernel.org>; Mon, 27 Nov 2023 13:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701092430;
	bh=tW6jQ9L2ZBt92Ge3AbOTrYVTEHkjf+ybjLUO9Men1QE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=NAJXuw+n0oDRfbNntNG0PTzgR2De4H3W+Uoz9C89pU5Hks7P7m5e+IbQPqMqpQ4bP
	 +9f6CJC6HfhJA/Q3XxkVYSAecHDbRnfc87AWAmMs4bROAhfESzta6O9HDIrpXYXD7+
	 2STbtfdlGGMBmYSUGRA52Eieh6dX2UVcj8p1vFjTkEdn+azX1uTvRsWqPLy/YKaoFK
	 Kh96iZlkU6MYDCYdWbrLdIou+f24kUjuc+f73XuEUdi7Rtq6u6jBRJRM333mdi6ADp
	 klNEG1c5FrVGTu8pHhTOy9pnrLRTaQG+EghPeGErNyH74F/fMKTGdQLQ626grm+8YO
	 O5MoxREtvfW6A==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5cc77e23218so42599057b3.3
        for <linux-firmware@kernel.org>; Mon, 27 Nov 2023 05:40:30 -0800 (PST)
X-Gm-Message-State: AOJu0YzzPTLv/eh4dE2yxHS0EAmEZ8AZfWZl12dI6P5xaGGLn22uvKWt
	UocJzlSe5oaBnHnRkYkibU6+FXtKOsPLgMGjV7o=
X-Google-Smtp-Source: AGHT+IE6pqg723PUO+eNEowpb0JzcIMHI1QkiPOX2SyFTM4ZFlIMXO2kZJWk8To4UcCxLI2SXcxJF5II6lncHf+Dw6c=
X-Received: by 2002:a0d:cf83:0:b0:5cb:dcfe:2ee0 with SMTP id
 r125-20020a0dcf83000000b005cbdcfe2ee0mr12871025ywd.12.1701092429694; Mon, 27
 Nov 2023 05:40:29 -0800 (PST)
MIME-Version: 1.0
References: <20231125042741.112038-1-chiahsuan.chung@amd.com>
In-Reply-To: <20231125042741.112038-1-chiahsuan.chung@amd.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 27 Nov 2023 08:40:18 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4eeRym6EUA9mZa9pXvY9m8iYubcAoACtcTARFLQBuoWw@mail.gmail.com>
Message-ID: <CA+5PVA4eeRym6EUA9mZa9pXvY9m8iYubcAoACtcTARFLQBuoWw@mail.gmail.com>
Subject: Re: pull request: amdgpu: update DMCUB firmware to v0.0.194.0\n
To: Tom Chung <chiahsuan.chung@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Alex Deucher <alexander.deucher@amd.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Deepak Sharma <deepak.sharma@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 24, 2023 at 11:27=E2=80=AFPM Tom Chung <chiahsuan.chung@amd.com=
> wrote:
>
>   amdgpu: update DMCUB firmware to 0.0.194.0 for DCN321 and DCN32 (2023-1=
1-25 12:14:44 +0800)
>
> are available in the Git repository at:
>
>   git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2023-11-25
>
> for you to fetch changes up to 87427f23282eb587a375c0e6e89f15e2b7a06db5:
>
>   amdgpu: update DMCUB firmware to 0.0.194.0 for DCN321 and DCN32 (2023-1=
1-25 12:14:44 +0800)

Pulled and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/78

josh
