Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47EF1C87FCE
	for <linux-firmware@archiver.kernel.org>; Fri, 25 Jul 2025 12:45:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1BEC1C4CEF6; Fri, 25 Jul 2025 12:45:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06186C4CEEB
	for <linux-firmware@kernel.org>; Fri, 25 Jul 2025 12:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753447550;
	bh=rY0690riUr06Ont/tb7fYEt3A/rvQlD+SaWEPbSgw5M=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Khc2BZKS6hQrbHO6812CH2TNWStWvhyb5sNrReYxYdEnJwSJIo8BPjsK6slpD0Lim
	 XIDyOXZUmaJetTcY1HTkIgG9wzdO76xOhSG1iRWso+9F3kLwS8a30ke5RqLI049JU4
	 LUtL6Qqp69t04Gt8LaCgajwmdxVHc68pJNx/SvgeNtaxjO1bjq/duroCiHorQWEoW6
	 ri1JJm6wuJhz7ac81fMD1PTsJ5AYH4uRi6H/o+Rf0LCH9PGs7zbOwoaqJqqAbSd6Gv
	 uCpXa4So9wRwByriZo9kukUaL9m7wX45SGQhZRWCWlRNQt/6ez9LeHMz8uZnS+AcrQ
	 NsKKoOmOc3oQA==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-718409593b9so22166407b3.3
        for <linux-firmware@kernel.org>; Fri, 25 Jul 2025 05:45:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXDta3j92EJSuvr9qj4pamCV1CB0KA2zX0TEu2EHA14Jqw5S8adtdJXfmUWRbChSSFtMwHBzbACnC6J4fXVDw==@kernel.org
X-Gm-Message-State: AOJu0YzbSLLgObK1qaquN8fAYXSZFPDmP7uBDACXjz2i+vlUJcseQV4k
	gstH0DLshrVnxWnX7Wig8aer3UMt7hfS3bqZFmxBjyIHbd6Z5vkh5TtId1V+cxo8sRpSCQbDjyb
	hHJ7nP2b2GoQ4x+yKjRzdbnqPaXIJ6ow=
X-Google-Smtp-Source: AGHT+IFhFkcA+vby3bnOj6+vUFfu/y4MC+FoKkxeKTRXX/chw31cHMNsnziVL4mal1hq1993sk05gkoGi6y0kRMOuq8=
X-Received: by 2002:a05:690c:6008:b0:70e:1d14:2b76 with SMTP id
 00721157ae682-719e381ff2bmr21201137b3.23.1753447549218; Fri, 25 Jul 2025
 05:45:49 -0700 (PDT)
MIME-Version: 1.0
References: <060c5bc3-8e18-e7ee-2c97-695b198f7b7a@quicinc.com> <i6vyneycavrhtwrolrjv23mg4z2wor22mkvsy7btzgpuh75vzk@zt2bvuiolgkv>
In-Reply-To: <i6vyneycavrhtwrolrjv23mg4z2wor22mkvsy7btzgpuh75vzk@zt2bvuiolgkv>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 25 Jul 2025 08:44:00 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5p3UMu0w6vizGSJG04YWFuCpNd3GvnTsJ6yKz4Dbr+Bw@mail.gmail.com>
X-Gm-Features: Ac12FXzWuE4e3_sl4KnmdpdIegk_oMSfuVUM1S3JpgdCirGMH8zJa4ZArRFkF1g
Message-ID: <CA+5PVA5p3UMu0w6vizGSJG04YWFuCpNd3GvnTsJ6yKz4Dbr+Bw@mail.gmail.com>
Subject: Re: qcom: Add firmware binary for SM8750
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>, linux-firmware@kernel.org, 
	"Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 25, 2025 at 7:05=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Fri, Jul 25, 2025 at 02:24:51PM +0530, Dikshita Agarwal wrote:
> > Hi,
> >
> > The following changes since commit 25ea3ecfb5418e5674137a5442727128e230=
61fe:
> >
> >   Merge branch 'amd-staging' into 'main' (2025-07-24 22:34:03 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > video-fw-sm8750
> >
> > for you to fetch changes up to 530f283206034b20ed791ef379f4394ca21fe63d=
:
> >
> >   qcom: Add firmware binary for SM8750. (2025-07-25 11:04:59 +0530)
> >
> > ----------------------------------------------------------------
> > Dikshita Agarwal (1):
> >       qcom: Add firmware binary for SM8750.
> >
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/626

josh
