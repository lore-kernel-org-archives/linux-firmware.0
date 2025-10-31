Return-Path: <SRS0=a7Qj=5I=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791E0CCF9F8
	for <linux-firmware@archiver.kernel.org>; Fri, 31 Oct 2025 13:36:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 444A4C4CEFB; Fri, 31 Oct 2025 13:36:45 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5E3D9C4CEF8
	for <linux-firmware@kernel.org>; Fri, 31 Oct 2025 13:36:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5E3D9C4CEF8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V8kwrc898142
	for <linux-firmware@kernel.org>; Fri, 31 Oct 2025 13:36:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kHoO9J/CB0m1l5siXEsM6o3+Nvz1+ZjxgyZnGy1/cEQ=; b=IKP8pgyPmUSD0W6g
	BlAW7SMOiXma4tqKDBSliLF1c5oEwZEVHgUzx4fYSfqPukvrr6B73tE9uF9vOLUB
	4DltqJ9DaNvuGuoIaGdv8IJrBw9YRFXFzzZrU5QRaxGxejoI3Zgl4meoAbXyadBR
	GQgvufgFiF9cJzLVqdZLJPucrwrm7ZBcbi8P8j2n73ieV9PY2947gyaNXwiR5/Q+
	tOyFd/4puFJJN6uUg2lNMfO1A+Ldhey38djnUV5gaGUPkn2B+cB3JzxPkvHRnAdb
	kmBMa8xvgnRKsMLtPxGrbOoB1M0pP5BDhE+ZxLxbQoL8SYJOLsnApUk95OJCtWXx
	FueuWA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4gb2270w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 31 Oct 2025 13:36:42 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-340562297b9so1638022a91.1
        for <linux-firmware@kernel.org>; Fri, 31 Oct 2025 06:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761917802; x=1762522602; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kHoO9J/CB0m1l5siXEsM6o3+Nvz1+ZjxgyZnGy1/cEQ=;
        b=cjlodz6hpAD+GtwSp5892kKPYZ9xMy0IBeCWSBIV+v6NzNTtUMucQqarz1xbHdn4po
         Y7F4ReyB7ykobGeVLC34uzvbrsZe08AYrP7DnNLKy0wgTWAcJA/WfaRoHyt2FdxQDSJN
         Se6CPml08OkDnJkgriJKrEgRlyAZ/REuNS+fqKCy7XX6b5P6OdIcHXkD9Dq53Iib4eF7
         MZKUA+Md42fKvyiIlb39Mis/gW08vXSD8rb2Cnue6HwfcTZlARLDtxVQjWloPXjXWs9p
         MYxq51Plj7JNjdtV0RShi8tL7331NfYkPae+mnFYrb86pjSd6zSNglyOb1qleLmGO89z
         K3vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761917802; x=1762522602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kHoO9J/CB0m1l5siXEsM6o3+Nvz1+ZjxgyZnGy1/cEQ=;
        b=Pw5L752IjM27XMNGhPU8R+8AtXZlTHYNZw0EdHkq5sHg//+OuUMLUUhOZvUakmvj4B
         N/uh3b+9L9v2gBHNa9BKISNH6oFx0Qsgjohr1I+gh3crmRkJAC5XJW7JLHunGNsHis0T
         qIJ1FNMcFx9+MamnK9OqLQVPsKz558s4Ta1SJMGFkjNwt037PV3KMnOyAZ6rNRD+i+AJ
         xQ1l+iIL1epwwu8A7hbwKyEOtG8ofEoTXYpyQbVaFnvyjYfMzjNMVx73zDrRjEi5t7+5
         TAhXdhhwr8slm9EwAxRtPWN59UFy26Ry0+IV/yAZcEAO+/WMwsVBDwWATcaxNRxPjZ0c
         yT9g==
X-Gm-Message-State: AOJu0YwcaICb3ciDezSU5JORFRc5yCnN0Qx7lexfSZ1c8+nhzxeo2OP5
	p7+liZh9MShJJEaJdu7A4f1g03xoEsIDiVyE+CONau2x5aHuu79hgd0e9UERWhiZmbYyYuRHkCU
	LMI5OVh2WVH9Wb7fiLLunSzjXtPshHXOU3vEwX4kiHyyhMgGDXjgw2BgTTUFz246e+hO7Szxf6K
	Tm3rCo0KE28QtVBZ4algnW3tWvSflLm4aR0oSGYZiPRfXdJw==
X-Gm-Gg: ASbGnculOK7xmiOtxLMMpYFwanA6HXdlwXmz28FYpE0iKRI72fM3caSQ2930P8rqB/P
	XxynapLO/rKX8mI0EsJS7ixzi83OPNL0RlnYCm/V46JWeB8UTVQ8rNSA/bowRUmp++jdnQXgpbC
	S/zkOEswXkwZPhF7hCAq+eAhqrbhx29h3Gcs57WJbxvzC+7j9yhJg20nPC
X-Received: by 2002:a17:90b:1c81:b0:340:29a3:800f with SMTP id 98e67ed59e1d1-3404ac93ee4mr9052341a91.15.1761917801305;
        Fri, 31 Oct 2025 06:36:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHC5IF8RdC06iK06RP7MVxrRm0ynlwltJOexeuKwFHaK8hChPCkmuD/0vbbVFajG18yAcZXLKuIaSDsLHSEFSY=
X-Received: by 2002:a17:90b:1c81:b0:340:29a3:800f with SMTP id
 98e67ed59e1d1-3404ac93ee4mr9052302a91.15.1761917800682; Fri, 31 Oct 2025
 06:36:40 -0700 (PDT)
MIME-Version: 1.0
References: <aa746f58-c004-48ea-ad75-59813f3c3252@oss.qualcomm.com>
 <CAO9ioeXxv4+68Mf2Li1YKmme75t1EstO9EwGd+RYt1WT9cZ72Q@mail.gmail.com> <d69544f0-8db1-4a6b-9cdb-180b9cd96c50@oss.qualcomm.com>
In-Reply-To: <d69544f0-8db1-4a6b-9cdb-180b9cd96c50@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 15:36:32 +0200
X-Gm-Features: AWmQ_bmOEkDvD7Mo8Kahrjf6HUqO2UMt1lHcaYQVwdC9C-J544F7D_xcj8gUGgo
Message-ID: <CAO9ioeVXeCBAzbKYhoKNHL63HOtbxAyM71WncAy32Rrp2xR6eg@mail.gmail.com>
Subject: Re: [GIT PULL] Bluetooth: QCA_BTUART: Separate firmware between
 WCN6855 and QCA2066
To: Zijun Hu <zijun.hu@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=efswvrEH c=1 sm=1 tr=0 ts=6904bb6b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=Qk2mxFHeKfSJNDczeV0A:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDEyMyBTYWx0ZWRfXw1pSEkwtrn4O
 N2lag5zBkeUeTSel0IRpqJL4dZfTFcVdRXqHXuj6ECiFmhJyccgwsO+L0gxPagCCYZBTTRDVCnx
 uIJfrYOo4BLGxLkY30ThhpvNpfOYGLHQtWpvNGaoqxh/yP3U/VQGbdqqdjqyrMiw7b7rJ9N/QwT
 rK/zi38mcTzTqTCrfSew9f4pAeJ5j955eGZoVBqe3hWjdPbmn2sxtZVkzj90yU9VwDd9M6F5oZA
 8n1QtvJWEzgg6fTt0M4HA4Zgbikj2uBYXXqnI6bFeDONk/S+hz+GJCPXkSmUsKxgx1cOJ7xv+FJ
 uSeVv3VgTCs0trObrJ6xxdgNAXMlF/NxzyHwPjzia2v4O6tg+Bntlxj20frSPkacfR4HCSxRDCy
 kQMW6tLkCpkTi1OOL88tNenfofbEJw==
X-Proofpoint-GUID: J_PhgYtlGDnTYDvlcJTeua4VupSbIs2J
X-Proofpoint-ORIG-GUID: J_PhgYtlGDnTYDvlcJTeua4VupSbIs2J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_04,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310123

On Fri, 31 Oct 2025 at 03:56, Zijun Hu <zijun.hu@oss.qualcomm.com> wrote:
>
> On 10/30/2025 7:02 PM, Dmitry Baryshkov wrote:
> > On Thu, 30 Oct 2025 at 12:50, Zijun Hu <zijun.hu@oss.qualcomm.com> wrot=
e:
> >>
> >> Hi linux-firmware maintainers
> >>
> >> Here's a pull request for QCA bluetooth driver. Please let me know if
> >> you have any problems.
> >>
> >> The following changes since commit bfc84303530a1cdd603fc40aa25b4452f10=
870dc:
> >>
> >>   Merge branch 'mt7925' into 'main' (2025-10-29 11:21:38 +0000)
> >>
> >> are available in the git repository at:
> >>
> >>   https://github.com/zijun-hu/qca_btfw move_qca2066
> >>
> >> for you to fetch changes up to 45b3867b446ec97326ab4d5a5cc81c9f811132d=
d:
> >>
> >>   Bluetooth: QCA_BTUART: Separate firmware between WCN6855 and QCA2066=
 (2025-10-30 18:21:04 +0800)
> >
> > From the commit message:
> >
> >> WCN6855 and QCA2066 currently share firmware in folder qca/, but this =
firmware sharing will be broken by WCN6855's firmware to up-stream. Fix by =
separating firmware as following: - Copy firmware used by QCA2066 from qca/=
 to qca/QCA2066/. - WCN6855 still use current folder qca/ for its firmware.
> >
> > What about existing QCA2066 devices which might get a new firmware,
> > but not the updated kernel / DT?
> >
>
> Customer did not up-stream QCA2066 DTS and also not specified firmware pa=
th
> in their down-stream DT blueooth node.
>
> Will change QCA bluetooth driver to change the default directory to downl=
oad
> QCA2066 firmware from qca/ to qca/QCA2066.

I'm sorry, it doesn't work that way. People might be using
linux-fimrware even without upstreaming DT. If existing firmware
worked for QCA2066 and WCN6855, then the firmware with the same path
must continue to work in future. If you are adding new firmware which
breaks this compatibility, then _it_ should go to some other place or
use a different filename, not the other way around. The driver should
also be able to fallback from the "new" location to the old one.

>
> Will do above change after next linux-firmware release containing this ch=
ange.
>
> thank you for change review.



--=20
With best wishes
Dmitry
