Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 860D2C43334
	for <linux-firmware@archiver.kernel.org>; Wed, 22 Jun 2022 10:28:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 515D7C341C6; Wed, 22 Jun 2022 10:28:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C41FC341C0
	for <linux-firmware@kernel.org>; Wed, 22 Jun 2022 10:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655893724;
	bh=g1PftLAK5S3ZwsTqydCZDzAjgv7e2+tQv95aQmEuQ9I=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=pXIfqTvu7vUgU1QNB6GlUtwKetUG5+K5MQROdoybzRYQnanWTP0gPg7c1HAb0SXfF
	 6TS5Ihr/L+olQ1kBNsTSe9cOACnUovLY68453se4ybpN2vYfCTfFXdqgTutJ2I7Skk
	 FT/6wQa78/kHE7V8Hsj9vuOGIJ43lrhE8uT5qTTRRevx3QtD59ehEMh9QPJ8o9nKP8
	 YgxZ+Y0hY3fKkA2gb9gj/bWXo19oh9yOw9MBUBl0/s1hnerFoabR4tqRZdKDcr2C+U
	 UpvJNxGsFCca9jF/p9OnzUYG231wkiF0uR+ErhdUcgX7Eo0Y2zcvJ2m+MS9rVpFBGj
	 r1cl/hdAHCJQA==
Received: by mail-il1-f181.google.com with SMTP id n12so3868335ilt.4
        for <linux-firmware@kernel.org>; Wed, 22 Jun 2022 03:28:44 -0700 (PDT)
X-Gm-Message-State: AJIora/O5Gg2Vk6PIwDu3c6NccIVeXZKZCnXvx2vhkJHdAVXeeoTIeVR
	gXqUDiohe33VD9RvCLuY9+m9OmhstHk6lXc9peE=
X-Google-Smtp-Source: AGRyM1tF4uPuedTBU+dgHx0oJWafWTmk55PWULCZZJ4ZyJjAnwDGeZiRo7vCgo67UmPxW3jRN+sNm5P49IznPcj4sEA=
X-Received: by 2002:a05:6e02:1aa8:b0:2d3:d69a:6d88 with SMTP id
 l8-20020a056e021aa800b002d3d69a6d88mr1612033ilv.243.1655893723441; Wed, 22
 Jun 2022 03:28:43 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_NaLJ4GcPFNKmOSLnwMTcmwXg_xRPfLxsojnn2R0GoGSA@mail.gmail.com>
In-Reply-To: <CADnq5_NaLJ4GcPFNKmOSLnwMTcmwXg_xRPfLxsojnn2R0GoGSA@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 22 Jun 2022 06:28:32 -0400
X-Gmail-Original-Message-ID: <CA+5PVA50Gi5e9OCA_k2A5Ri8N_Qp0eH1jP9v4f9Ag2DCSqE+GA@mail.gmail.com>
Message-ID: <CA+5PVA50Gi5e9OCA_k2A5Ri8N_Qp0eH1jP9v4f9Ag2DCSqE+GA@mail.gmail.com>
Subject: Re: Update amdgpu VCN firmware for yellow carp
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	Veerabadhran Gopalakrishnan <veerabadhran.gopalakrishnan@amd.com>, Leo Liu <leo.liu@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 21, 2022 at 12:43 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Updated VCN firmware.  Please apply!

Applied and pushed out.

josh
