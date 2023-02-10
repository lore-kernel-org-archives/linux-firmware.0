Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80198C05027
	for <linux-firmware@archiver.kernel.org>; Fri, 10 Feb 2023 19:32:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 69D73C433D2; Fri, 10 Feb 2023 19:32:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 544F4C4339C;
	Fri, 10 Feb 2023 19:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676057536;
	bh=ug38gwWwqd9WD7MkHSHdssRPnvuW50g2Hiq4i4QvHrE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=d97WB41x9xjhzbNzjAwTX9Yi6mkqWtq7nmD6+3AS7yRbfFgkI/OJmFEQ9/KeTOvGL
	 O+Rwsy/8AchBcU+vbWI8ya2/vTTi0SntQ1JNj6lUJvMXgW0wn4cGDxvaH99eHow16t
	 JQbwztARuN1Az1A0Y4dh2tPwk3WLAbzsV/MHaGKKrrF4Ets8SmBVJF1A/4k1RKK2Bw
	 W7ydIn4YLUUJdCteR4PTouz92ud6pa7GUbd/mmKSlvOWmjW3hJs1oN3VIkzLrHCYqW
	 81gXzvcB2Cme6+7c9sHcUxIRikTJ5DgdVkh5pNovidwAxAhMGqdVjzqlLzdag7xiXL
	 rMviWfXhsIdiQ==
Received: by mail-yb1-f175.google.com with SMTP id o66so1692466ybc.0;
        Fri, 10 Feb 2023 11:32:16 -0800 (PST)
X-Gm-Message-State: AO0yUKUEdqmXuuBUMEs6VGPfqBwFIK9o4pvtoxEHfrZCIiiaWyG5BzUw
	odOz5nyS5HT7D9Etx54OwblnScQtALmCsNLIIFM=
X-Google-Smtp-Source: AK7set9Gpb9Gq1fYiZD9UwaPC7TNCPhV7FIDrrS322ktWhtu3+sWil4TSvcVf+ctl+QPhsmhHOpZHh/s+yJiqS3HkMw=
X-Received: by 2002:a05:6902:c2:b0:85b:5c5b:db10 with SMTP id
 i2-20020a05690200c200b0085b5c5bdb10mr1910879ybs.485.1676057535418; Fri, 10
 Feb 2023 11:32:15 -0800 (PST)
MIME-Version: 1.0
References: <20230202165547.xb4uet45aywmt6js@gjsousa-mobl2>
In-Reply-To: <20230202165547.xb4uet45aywmt6js@gjsousa-mobl2>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 10 Feb 2023 14:32:04 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4A8EEff7GTu+162+s_J3eP-_a_-PQk9dM0VSPCnHgPWg@mail.gmail.com>
Message-ID: <CA+5PVA4A8EEff7GTu+162+s_J3eP-_a_-PQk9dM0VSPCnHgPWg@mail.gmail.com>
Subject: Re: PR for ADLP DMC v2.18
To: Gustavo Sousa <gustavo.sousa@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, "jwboyer@kernel.org" <jwboyer@kernel.org>, 
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "kyle@mcmartin.ca" <kyle@mcmartin.ca>, 
	"Hutchings, Ben" <ben@decadent.org.uk>, Anusha Srivatsa <anusha.srivatsa@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 2, 2023 at 11:56 AM Gustavo Sousa <gustavo.sousa@intel.com> wrote:
>
> The following changes since commit 5c11a3742947810ee8bffbd476eb5a1b0c7999f2:
>
>   amdgpu: Add VCN 4.0.2 firmware (2023-01-25 07:40:41 -0500)
>
> are available in the Git repository at:
>
>   git://anongit.freedesktop.org/drm/drm-firmware.git dmc-adlp_2.18

Pulled and pushed out.

josh

> for you to fetch changes up to a5046f435699b88a20fe9f5803da2a5c2f604a7f:
>
>   i915: Add DMC v2.18 for ADLP (2023-02-02 12:58:28 -0300)
>
> ----------------------------------------------------------------
> Gustavo Sousa (1):
>       i915: Add DMC v2.18 for ADLP
>
>  WHENCE            |   3 +++
>  i915/adlp_dmc.bin | Bin 0 -> 78500 bytes
>  2 files changed, 3 insertions(+)
>  create mode 100644 i915/adlp_dmc.bin
