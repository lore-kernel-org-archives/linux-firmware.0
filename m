Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D3FC678D4
	for <linux-firmware@archiver.kernel.org>; Tue, 17 Jan 2023 12:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B2FEDC43396; Tue, 17 Jan 2023 12:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CCBBC433F0
	for <linux-firmware@kernel.org>; Tue, 17 Jan 2023 12:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673960116;
	bh=SQKkD9/mMG1qy6RmcgwZ/CE7ttAJSOKnEee8TRy+wFw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Ngw5fcLZ4KPN64TmYeWee8mGXdUCKs+QsP67uu5TJnvv2b6IlEU4JJnjprxru7huI
	 fdEtO0+Fvw/swEsgYXudFkNXKT9LHzsJYdK/odJIyV2nt+ZObzKz8XhXPQF9y4PtHW
	 t2gET2ziNwJBH+Zmo4k6j8qImHXxu6vmStQcJD5WO7rO20mtCDWK2/yswoBnzLD4Zf
	 8qxm29nI0Ek4R2mcWhKap0P+tYriR9ksQZ0ZOSdewdwxmIeDKaQkN0BOszSmJHwF6X
	 ADJfULCNUiJzNZhbsN0EKbovLimOOm4XdoXedLzIAUOrdg7SaU1M7X68SlXylA53fk
	 oGkDVZYrGJQVg==
Received: by mail-yb1-f175.google.com with SMTP id t15so33856997ybq.4
        for <linux-firmware@kernel.org>; Tue, 17 Jan 2023 04:55:16 -0800 (PST)
X-Gm-Message-State: AFqh2koAY2W9yklbQr9ZzYRziMBDraOQ2eigpoTy2iBf330Vs5o9iSXC
	dgTdmV6v8OVrXO93Nnp7mJ7ZWMAU2aR2eoWXWno=
X-Google-Smtp-Source: AMrXdXvi5gjDVkR2Ed2723pExtZ2uOK3o8TU0RatEwkKLPu+VtqezxIxQBGngF8B/AhKnoynZsucsyBvbxCpe4uN9Vs=
X-Received: by 2002:a25:bc8a:0:b0:7d2:ef2:9264 with SMTP id
 e10-20020a25bc8a000000b007d20ef29264mr289997ybk.603.1673960115575; Tue, 17
 Jan 2023 04:55:15 -0800 (PST)
MIME-Version: 1.0
References: <20230102131443.905304-1-dmitry.baryshkov@linaro.org>
 <CA+5PVA5ZXLZM=iVvr9tMSGeRbRLgzuODt4bkt+ZvMnzF50MU3w@mail.gmail.com> <d6aa1de2-55c5-c9cd-76f6-d94e91ca4e84@linaro.org>
In-Reply-To: <d6aa1de2-55c5-c9cd-76f6-d94e91ca4e84@linaro.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 17 Jan 2023 07:55:04 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6HTmkaOxcK3ZP7GWtj9tNs74teygfb_pvc3=OJ8=R4nQ@mail.gmail.com>
Message-ID: <CA+5PVA6HTmkaOxcK3ZP7GWtj9tNs74teygfb_pvc3=OJ8=R4nQ@mail.gmail.com>
Subject: Re: [PATCH] qcom: add firmware files for Adreno A200
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Rob Clark <robdclark@gmail.com>, 
	Jonathan Marek <jonathan@marek.ca>, Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 11, 2023 at 10:17 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 11/01/2023 14:51, Josh Boyer wrote:
> > On Mon, Jan 2, 2023 at 8:14 AM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> >>
> >> Add firmware files for Adreno A20x (codenamed yamato), found in
> >> Freescale i.MX51/i.MX53 and in some prehistoric Qualcomm Snapdragon
> >> SoCs.
> >>
> >> The firmware were generated from the header files from EfikaMX kernel
> >> sources ([1]), which bear copyright by QUALCOMM Incorporated and have
> >> BSD-3-Clause licence.
> >
> > How did you generate it?
>
> I hope you don't mind putting the program here.

Not at all.  Thanks.  Patch applied and pushed out.

josh

>
> // SPDX-License-Identifier: BSD-3-Clause
> /*
>   * Copyright (C) 2022 Linaro Ltd.
>   * Author: Dmitry Baryshkov
>   */
>
> #include <stdio.h>
> #include <stdint.h>
> #include <string.h>
> #include <errno.h>
> #include <unistd.h>
>
> typedef uint32_t uint32;
>
> #include "pm4_microcode.inl"
> #include "pfp_microcode_nrt.inl"
>
> int dump(const char *name, uint32_t *data, size_t n)
> {
>         FILE *f;
>         int ret;
>         uint32_t zero = 0;
>
>         f = fopen(name, "w");
>         if (!f) {
>                 fprintf(stderr, "fopen: %s: %s\n", name, strerror(errno));
>                 return 1;
>         }
>
>         if (fwrite(&zero, 4, 1, f) != 1) {
>                 fprintf(stderr, "error writing data\n");
>                 fclose(f);
>                 unlink(name);
>                 return 1;
>         }
>
>         ret = fwrite(data, 4, n, f);
>         if (ret != n) {
>                 fprintf(stderr, "error writing data\n");
>                 fclose(f);
>                 unlink(name);
>                 return 1;
>         }
>
>         fclose(f);
>
>         return 0;
> }
>
> int main(int argc, char **argv)
> {
>
>         if (argc != 3) {
>                 fprintf(stderr, "Usage: %s <pfp> <pm4>\n", argv[0]);
>                 return 1;
>         }
>
>         if (dump(argv[1], aPFP_Microcode_nrt, PFP_MICROCODE_SIZE_NRT))
>                 return 1;
>
>         if (dump(argv[2], &aPM4_Microcode[0][0], PM4_MICROCODE_SIZE * 3))
>                 return 1;
>
>         return 0;
> }
>
>
> >
> > josh
> >
> >> [1] https://github.com/genesi/linux-legacy/tree/master/drivers/mxc/amd-gpu
> >>
> >> Cc: Rob Clark <robdclark@gmail.com>
> >> Cc: Jonathan Marek <jonathan@marek.ca>
> >> Cc: Fabio Estevam <festevam@gmail.com>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> ---
> >>
> >> Note: the following patch needs to be applied to get this firmware to
> >> work. It is most likely to find its way into the 6.3 kernel.
> >>
> >> https://lore.kernel.org/dri-devel/20230101155753.779176-1-dmitry.baryshkov@linaro.org/
> >>
> >> ---
> >>   LICENSE.qcom_yamato |  25 +++++++++++++++++++++++++
> >>   WHENCE              |  13 +++++++++++++
> >>   qcom/yamato_pfp.fw  | Bin 0 -> 1156 bytes
> >>   qcom/yamato_pm4.fw  | Bin 0 -> 9220 bytes
> >>   4 files changed, 38 insertions(+)
> >>   create mode 100644 LICENSE.qcom_yamato
> >>   create mode 100644 qcom/yamato_pfp.fw
> >>   create mode 100644 qcom/yamato_pm4.fw
> >>
> >> diff --git a/LICENSE.qcom_yamato b/LICENSE.qcom_yamato
> >> new file mode 100644
> >> index 000000000000..1fd702bb9264
> >> --- /dev/null
> >> +++ b/LICENSE.qcom_yamato
> >> @@ -0,0 +1,25 @@
> >> +Copyright (c) 2008-2011, QUALCOMM Incorporated. All rights reserved.
> >> +
> >> +Redistribution and use in source and binary forms, with or without
> >> +modification, are permitted provided that the following conditions are met:
> >> +    * Redistributions of source code must retain the above copyright
> >> +      notice, this list of conditions and the following disclaimer.
> >> +    * Redistributions in binary form must reproduce the above copyright
> >> +      notice, this list of conditions and the following disclaimer in the
> >> +      documentation and/or other materials provided with the distribution.
> >> +    * Neither the name of QUALCOMM Incorporated nor
> >> +      the names of its contributors may be used to endorse or promote
> >> +      products derived from this software without specific prior written
> >> +      permission.
> >> +
> >> +THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
> >> +AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
> >> +IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
> >> +ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
> >> +LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
> >> +CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
> >> +SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
> >> +INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
> >> +CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
> >> +ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
> >> +POSSIBILITY OF SUCH DAMAGE.
> >> diff --git a/WHENCE b/WHENCE
> >> index f31fa308cc89..f14730a31368 100644
> >> --- a/WHENCE
> >> +++ b/WHENCE
> >> @@ -5742,6 +5742,19 @@ https://developer.qualcomm.com/hardware/dragonboard-410c/tools
> >>
> >>   --------------------------------------------------------------------------
> >>
> >> +Driver: adreno - Qualcomm Adreno GPU firmware
> >> +
> >> +File: qcom/yamato_pfp.fw
> >> +File: qcom/yamato_pm4.fw
> >> +
> >> +Licence: Redistributable, BSD-3-Clause licence, See LICENSE.qcom_yamato
> >> +
> >> +Binary files generated from header files in EfikaMX kernel sources. A prefix of
> >> +four zero bytes was prepended to make them work with the DRM MSM driver. See
> >> +https://github.com/genesi/linux-legacy/tree/master/drivers/mxc/amd-gpu
> >> +
>
> --
> With best wishes
> Dmitry
>
