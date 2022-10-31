Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6F9FA3741
	for <linux-firmware@archiver.kernel.org>; Mon, 31 Oct 2022 15:10:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BAB39C43141; Mon, 31 Oct 2022 15:10:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A299C433C1;
	Mon, 31 Oct 2022 15:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667229012;
	bh=Ap80IdSr5NYT9j6T8WURnBvCDV05LB2/0eNMCc1zZyg=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=NVDOsofkmpdExt8mxgGQ8VtMWuYDf/rf725NPKKvPomIVicZQWr4eMnhwoazEje2w
	 qh8UrzsRUQE1hc62y9Jssn7u6gSgr/cHTqaKGhgGqk7VcpBZI0CiS03+qqRvYNILnf
	 +dp1fJOVcRzPXUtcyjD4bMAVz8jJ54dOvBGiBkDixUag9ETKFfCeewUA9EuLIk1nHH
	 v2wraCgIWJVh9QkiyAHrDSlsTmb+IZPMW8Kv3Q9wpeLb8ypoCQjh50z8dKFHFfwwEY
	 1qOqqYhLuc7YeHp4S6UAxgtu3DGO5pWWcWQipCkrSfSYrY2LDooPIhLjsVGhJGBM+D
	 i4wXb0pps7g5A==
Received: by mail-ot1-f44.google.com with SMTP id cy15-20020a056830698f00b0065c530585afso6919523otb.2;
        Mon, 31 Oct 2022 08:10:12 -0700 (PDT)
X-Gm-Message-State: ACrzQf2TVqyYFUznp2dphYuUwk6q2IDd59mFSqp5+9Pm/LpRuaBAUP3i
	BwJAKpCWgOlSkfG4j7zO49kZwue3GhR6hVzBfmY=
X-Google-Smtp-Source: AMsMyM40iBQdzl9o2fGZyZOl1+WbPn6YlSLJeTCHvbuVlK1PfGVYJld7ySeZEiz53zOu5ad2+uEZlaVOYQ77El23gI8=
X-Received: by 2002:a05:6830:6089:b0:660:ea3e:46b7 with SMTP id
 by9-20020a056830608900b00660ea3e46b7mr6897419otb.166.1667229011760; Mon, 31
 Oct 2022 08:10:11 -0700 (PDT)
MIME-Version: 1.0
References: <CANHAJhH41JnZA_fPNczMpBwnTy5P-5xhgPY5_eHkOsBzx0Qy=A@mail.gmail.com>
 <d31e3aa3-fdec-f0b1-f400-0ea6055a0f6c@linaro.org> <CANHAJhFiVRxaDwfV5ej0c5o7JJ6cjRwoUiy2dvnSyGHo1H_ibA@mail.gmail.com>
 <DM8PR02MB8169E094A6CF46DED4D745E3F3309@DM8PR02MB8169.namprd02.prod.outlook.com>
In-Reply-To: <DM8PR02MB8169E094A6CF46DED4D745E3F3309@DM8PR02MB8169.namprd02.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 31 Oct 2022 11:10:01 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7=k0fp5fVpiHO2uYC4vs6W_mN632ETYM29yJBujweMBA@mail.gmail.com>
Message-ID: <CA+5PVA7=k0fp5fVpiHO2uYC4vs6W_mN632ETYM29yJBujweMBA@mail.gmail.com>
Subject: Re: [PULL V4]: qcom: SC7180 and SC7280 venus firmware updates
To: Vikash Garodia <vgarodia@qti.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Nathan Hebert <nhebert@chromium.org>, 
	"dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Fritz Koenig <frkoenig@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 26, 2022 at 3:21 AM Vikash Garodia
<vgarodia@qti.qualcomm.com> wrote:
>
> Hi Nathan,
>
> > -----Original Message-----
> > From: Nathan Hebert <nhebert@chromium.org>
> > Sent: Wednesday, October 26, 2022 3:24 AM
> > To: dmitry.baryshkov@linaro.org
> > Cc: linux-firmware@kernel.org; linux-arm-msm@vger.kernel.org; Bjorn
> > Andersson <andersson@kernel.org>; Fritz Koenig <frkoenig@chromium.org>;
> > Vikash Garodia <vgarodia@qti.qualcomm.com>
> > Subject: Re: [PULL V4]: qcom: SC7180 and SC7280 venus firmware updates
> >
> > WARNING: This email originated from outside of Qualcomm. Please be wary of
> > any links or attachments, and do not enable macros.
> >
> > On Tue, Oct 25, 2022 at 2:48 PM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On 26/10/2022 00:32, Nathan Hebert wrote:
> > > > The following changes since commit
> > 48407ffd7adb9511701547068b1e6f0956bd1c94:
> > > >
> > > >    cnm: update chips&media wave521c firmware. (2022-10-17 10:20:43
> > > > -0400)
> > > >
> > > > are available in the Git repository at:
> > > >
> > > >    https://github.com/nathan-google/linux-firmware.git
> > > > update_sc7180_and_sc7280_firmware_v4
> > > >
> > > > for you to fetch changes up to
> > 05df8e65182f7ee945f826e41b5eaa17c188a8df:
> > > >
> > > >    qcom: update venus firmware files for VPU-2.0 (2022-10-25
> > > > 14:16:59 -0700)
> > > >
> > > > ----------------------------------------------------------------
> > > > Nathan Hebert (4):
> > > >        qcom: replace split SC7180 venus firmware images with symlink
> > > >        qcom: update venus firmware file for v5.4
> > > >        qcom: remove split SC7280 venus firmware images
> > > >        qcom: update venus firmware files for VPU-2.0
> > >
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >
> > > Please excuse me for being too picky.
> > No worries! Thanks for helping me get the change right.
>
> Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>

Pulled and pushed out.

josh
