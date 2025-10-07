Return-Path: <SRS0=iq66=4Q=oss.qualcomm.com=janaki.thota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9263CAC5B0
	for <linux-firmware@archiver.kernel.org>; Tue,  7 Oct 2025 06:53:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BC1CEC4CEF9; Tue,  7 Oct 2025 06:53:00 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CA674C4CEF7
	for <linux-firmware@kernel.org>; Tue,  7 Oct 2025 06:52:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CA674C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5973LgpU012086
	for <linux-firmware@kernel.org>; Tue, 7 Oct 2025 06:52:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SXlJgXaQo63t8utlQWLnOJE69skysdrsF+03Kedgp1g=; b=SPcijufxd2Jnqr/k
	w7MaiHje9FbyD0jd8Ra106B+nzEmi0qzlXKrd5BmL/WC6+JnvbatfsEdTHshwUxk
	RW/oovc2CeoTWHVggWJY/A3mC60UtMGNSd3Iw5YVLbIjm/tl02joQRBheSE4v9G+
	/KQ2cQWGbwA0/chhmVqAMowXrXUSDSCNzn9GyM90e1gi5Me/HxLJ2OorznX1VJGj
	idZR9V61RLGwpLovGuisUopnsnON2aDHa3zOuTjSvfmcXUKFoHZnHB13GxMYoyBE
	5clIQjs1hYCbZldAKn0R/7AzooSTaPyDkAgEACh2EuwdQt7C3aHpZu1z9B6XO5bh
	IVWbCA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxn6kgw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 07 Oct 2025 06:52:58 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-43f642bb178so6017185b6e.0
        for <linux-firmware@kernel.org>; Mon, 06 Oct 2025 23:52:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759819978; x=1760424778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SXlJgXaQo63t8utlQWLnOJE69skysdrsF+03Kedgp1g=;
        b=vkkgROq9Y7uyyERCefIMjyanja8e56jANVApJjFJqzMsrlYPbNShNf2BoHo4CBWwbX
         s/No+uOxGYgORDyMtOne7vdSKbyWMpGc/5Wwm7drLVcKQhE5zQMTG04COm9SLin8WC4v
         Q2ngdbBOGA73aGUPWlGQG/UphiSw5cdYqFaKMcApdd6+1YCOF5+DkUAcUYgTavF5TrB2
         vTKVVI9O7ujBJyUXC3q5awdcWv6saRvFBRMnMQBtNdVyXaF09E6vF1mRVNKKflD4/Wr/
         ZA+36+W1fQyj4BKJSxybVpSK3FfTqlXenfrRr0YlOQmziFiGTieLL6UeeWzMCx7VqPTk
         cVKA==
X-Gm-Message-State: AOJu0YzT2lDDbX9+fXkL8MfnWpvnGy1Dj+0Z8H0LnSTURU84jBme+0iM
	pQnjLrx6fkByTz3shz6wqGLuoSd1bUG9oJCWeymX6C8gZQVw82z6nCcLVW/ul2A+jxQbaPmknKh
	FZkVTnJSUDDEGPUT51hrknjltVDu8noT/Hm47CjoxiH8sR+WvxrPiaTsEx655+dtadh7T+CmQAl
	gQJCxB2RZuGv2hVnU8vNuhoEzOSeCOEuPipp4/sg==
X-Gm-Gg: ASbGncsqChBdV5odkcdaA9kYezOTWIoVBx3DeBbhxIkgK1ebj6xzVygLbXKXcw+D8hl
	cgpHULAUVRKn4w+6oG/BVR0A0N0Pt/664icaygmZEmqLlP3CuQywsQi+XVF4DJRz6aBLfd2ORq5
	ocWh1ZoZEE7Dwtgh6c3AjvA5SX8fA=
X-Received: by 2002:a05:6808:4f1e:b0:43b:2829:e643 with SMTP id 5614622812f47-43fc182dc63mr6859903b6e.25.1759819977775;
        Mon, 06 Oct 2025 23:52:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCx9Pc7xFEc4chfQhm1H+iJwTmzOwlHp1109/mtZTvpvQ1IvI8D0o2NGnFjD/1m/16U/nnb9So/ZeqdB9STLo=
X-Received: by 2002:a05:6808:4f1e:b0:43b:2829:e643 with SMTP id
 5614622812f47-43fc182dc63mr6859892b6e.25.1759819977264; Mon, 06 Oct 2025
 23:52:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAPiVHHi2dk5eX2vRqzX014q__WH=-YNghqv-kZgSfbzGvUgJHA@mail.gmail.com>
 <CAO9ioeWCfAFMZEwpC5U=Jh006TR38qhE9uzgTpWnq7YDfSOvHw@mail.gmail.com>
In-Reply-To: <CAO9ioeWCfAFMZEwpC5U=Jh006TR38qhE9uzgTpWnq7YDfSOvHw@mail.gmail.com>
From: Janaki Ramaiah Thota <janaki.thota@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 12:22:46 +0530
X-Gm-Features: AS18NWAgFBGFJ5QSmm-el41tEpN_tEZzThYcWxGw9lJWClFbZy4ORgBGvCYOB0I
Message-ID: <CAPiVHHiTQpEgC7Fs4qYQJ_N3a+nT2LGKD3xkwjBfmfyD08SZgQ@mail.gmail.com>
Subject: Re: [GIT PULL] qca: Update Bluetooth WCN6750 1.1.3-00091 firmware to 1.1.3-00100
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, hbandi@qti.qualcomm.com,
        mohamull@qti.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfX/DmBGlW0L+sf
 X+AYRxUkSuF8++ynpU/ywaOwVKHnSLGClNloja7oqbWoaqvNbbhZUwHp0YAbVD/juR+VByGb5Vt
 7WOg9Mw4DidIaPh+ba77y7LlmWRDwcoCLyYuXTGH4V9eKXzNq1CYRro5q01/IiuaL8K3T6Ughyy
 /JQ1Y3M4tgMQYWSNbFRlDA46qj8DjPEs/HM9+nZur4lGwxsokgIkv36+TQbT36cS4gzmZCDi5he
 blB66mE5t7SPr7tISt1UWPzdY/ZZY0ZYDvfy3EVggJku2hIvdH2vYwdrHJS4R0OjkPcvBH6wSGW
 MCYJV0LifoNWTHCG6qYgGC8c07gRiq8TiayRBIJT+7/hoF4g1M7wOE/6NjeG0+uEuptLqy8ZF65
 bnBa9hTf8Mv9IbBuSjyZlZLhwyD8Jg==
X-Proofpoint-GUID: 7_V1YYmN0lrwKIapK1jpMzBLz_Lzjnh0
X-Proofpoint-ORIG-GUID: 7_V1YYmN0lrwKIapK1jpMzBLz_Lzjnh0
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e4b8ca cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=4cxx8801mfw4m65z15MA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040001

On Mon, Oct 6, 2025 at 5:21=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Mon, 6 Oct 2025 at 14:18, Janaki Ramaiah Thota
> <janaki.thota@oss.qualcomm.com> wrote:
> >
> > Hi linux-firmware maintainers,
> >
> >  Here's a pull request for bluetooth firmware. Please let me know if
> >  you have any problems.
> >
> > The following changes since commit 46a6999a2d14a5f2239e7e712e5bbcf543f5=
9034:
> >
> >   Merge branch 'robot/pr-0-1759560666' into 'main' (2025-10-04 21:36:21=
 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://github.com/quicjathot/bt_msl_fw_1.1.3_00100.git HEAD
>
> This commit changes the default NV dump, but leaves two board-specific
> files untouched. Are they still compatible with the new firmware?
>

Hi Dmitry, Thanks for the quick review!!
Updated the below pull request with updated remaining two files

The following changes since commit 46a6999a2d14a5f2239e7e712e5bbcf543f59034=
:

  Merge branch 'robot/pr-0-1759560666' into 'main' (2025-10-04 21:36:21 +00=
00)

are available in the Git repository at:

  https://github.com/quicjathot/bt_msl_fw_1.1.3_00100.git HEAD

for you to fetch changes up to e06a43b9eee777b8fd9197c09b50c8744118e8d7:

  qca: Update Bluetooth WCN6750 1.1.3-00091 firmware to 1.1.3-00100
(2025-10-07 12:14:26 +0530)

----------------------------------------------------------------
Janaki Ramaiah Thota (1):
      qca: Update Bluetooth WCN6750 1.1.3-00091 firmware to 1.1.3-00100

 WHENCE           |   8 +++++---
 qca/msbtfw11.mbn | Bin 202276 -> 202464 bytes
 qca/msbtfw11.tlv | Bin 190064 -> 190252 bytes
 qca/msnv11.b09   | Bin 5847 -> 5885 bytes
 qca/msnv11.b0a   | Bin 5847 -> 5885 bytes
 qca/msnv11.bin   | Bin 5905 -> 5885 bytes
 6 files changed, 5 insertions(+), 3 deletions(-)

> >
> > for you to fetch changes up to 64b8572f8542709bb9331fd30da0165c4ecfdc24=
:
> >
> >   qca: Update Bluetooth WCN6750 1.1.3-00091 firmware to 1.1.3-00100
> > (2025-10-06 16:18:31 +0530)
> >
> > ----------------------------------------------------------------
> > Janaki Ramaiah Thota (1):
> >       qca: Update Bluetooth WCN6750 1.1.3-00091 firmware to 1.1.3-00100
> >
> > Thanks,
> > Janakiramaiah Thota
>
>
>
> --
> With best wishes
> Dmitry

Thanks,
Janaki Ramaiah Thota
