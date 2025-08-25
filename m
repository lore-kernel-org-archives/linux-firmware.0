Return-Path: <SRS0=BsXr=3F=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE5B6CA0FE1
	for <linux-firmware@archiver.kernel.org>; Mon, 25 Aug 2025 09:52:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 96B1BC116B1; Mon, 25 Aug 2025 09:52:08 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B8E5BC4CEF1
	for <linux-firmware@kernel.org>; Mon, 25 Aug 2025 09:52:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B8E5BC4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8WSaB031759
	for <linux-firmware@kernel.org>; Mon, 25 Aug 2025 09:52:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	weLRCMvuGByOwvfDW6LKu+MzE1rxOomC4c8FSHM0Cwc=; b=d1TBvjlGUmX0mTf+
	MPcnG+S6xu52KankQ+x1ja0PW0b/W2hlxraej6nZ+VLCWYk/y2UsdeMDArAHmRT5
	o+iCKmoqMoNJf83+DtLbpgRLu8fubtNUU9x7CltQ+d++nMV3HZ4w8YNOmYYCbmBA
	Tm2D2tqh4xu5R91AubWVsPPbjS0QcDsNwNtXdIf9n+TWEgHkKLFH9JqTuq1syCJl
	8F4HU9fuiE5MXzsi/I7vY7gQ2RAN8m70jgob7kWzLvVqlZ4t6S5ajlGE0dVp9252
	Nxu8AfjezEKXMkBvyFHyFzlSiGAArWRdH5RVcH2c/hGTED8pEgPKEtP0GsQqcBSc
	h5vrpw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5uc4jfe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 25 Aug 2025 09:52:06 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70db892e7b2so21676886d6.1
        for <linux-firmware@kernel.org>; Mon, 25 Aug 2025 02:52:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756115526; x=1756720326;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=weLRCMvuGByOwvfDW6LKu+MzE1rxOomC4c8FSHM0Cwc=;
        b=uxW5N2fWKv+JerFO+ENoyHhjX/0B7RBo4TXUIiKAaFDMsGzchehOJ5IUNli5/Jw6Iu
         55ADJ4vkSK9SN1c2k/G6vy+ShXZ6lswLlD3CWqcZu9sUUggc/A9EYgEid4dls73snh7R
         M3mK44TZvaFnqx1M7dWAKzb78xDsxBzMkFRCC4+EQzXdArRZ3rUfAQqGu9j4+WYUncUW
         QR9KfOX6qRbZLmwJE0VlzEiFnQ3COwK5kv6EmNpNC7gN05NbbxzyG+S6/HMWQbp+AMap
         C0xNTYJk+XUUfKwQEHiJZNRUiQEawenwKIZWxLCRYfuIC3qiJztJyl/fzPf+cpcp11xo
         4imA==
X-Forwarded-Encrypted: i=1; AJvYcCWM0WypGINESlDUwoqQrW9opmXJ9frLbbdpWqSWYQ71ca0eSh0uHBB3ZCylgQrOC6Vh3JZOwQHqN90zKtrFhw==@kernel.org
X-Gm-Message-State: AOJu0YwY8YebudJS0dtRVfcdRhTR0V+S4BSFRBGKx7MtWLF0RPh6diAi
	I20GT2gfVTI96zXTzUAAsGVvfDRc9kyl29yVSi8qsPeF/uAOn3mQXHl56A5jrQ5otbI6smrXUuy
	OaWcdpJ9O6tUi7e07Jw3dmKa5sCwlQHBiQ/4l2IMEunCt1tnThJQ7WQOxrAY9RhoF/sS1dLA=
X-Gm-Gg: ASbGncuylO+ini8pU91I6eP6EAhfYxg/8+EdVZwJ1rqzw9gsDbg4v60X8Fe+BlejkLu
	M8hkmGbEMY2iVxiSm4w4WAbmeOqiKkgn0g6dVZpL2i0Z+0V8ujsGTwfk5betIxn0vi0cHXDhQYa
	9t459Aa8tRxRra5MTVNG5B/J8VG7H4ZhLx8nJVvWmAj/zEcE2p0P/ml8umhGjHC7Pq6U4tYyRIA
	0ck5u478MidUFVv1iIKargGzeS6NAm6rHkk+zEDYlaGop6T/hgEfI9mDc3hhAKjPqAP0xxse+tx
	igKOAsBUTNkPzu1WzUUFq9cTTT+rdeSBRhuGvv7C+Hi65JNZlfaF+HUZI0KrYXHOTo5Zpu9Vu7M
	tVsEXMg3ih1z+OrDLkqmMPM484m0d15Tz8G+bvhHFcAZXv6bzChZu
X-Received: by 2002:a05:6214:d8b:b0:709:dd30:fc79 with SMTP id 6a1803df08f44-70d970ccb9fmr140273596d6.23.1756115525584;
        Mon, 25 Aug 2025 02:52:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSIUWgakTvdOoaiGPCbgglDTW6L++UyR5jTeF/O/YqKPFu7sH8b6g74SQ5S1LA/Y/Sv/e5rA==
X-Received: by 2002:a05:6214:d8b:b0:709:dd30:fc79 with SMTP id 6a1803df08f44-70d970ccb9fmr140273436d6.23.1756115525119;
        Mon, 25 Aug 2025 02:52:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35cb358esm1555511e87.156.2025.08.25.02.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 02:52:04 -0700 (PDT)
Date: Mon, 25 Aug 2025 12:52:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xin Liu <xin.liu@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Josh Boyer <jwboyer@kernel.org>, linux-firmware@kernel.org
Subject: Re: qcom: add CDSP firmware for qcs615 platform
Message-ID: <hx4l4h3bn36kxt2vsjm2zcrv3ho53e42qj6v6rtd5ub3ox3ekk@lyldagrlapsl>
References: <4364ed17-0d85-4bf5-b1f4-7cfec60d6859@oss.qualcomm.com>
 <CA+5PVA6_-vuvwhAAZ3p98aOYyTfdQLishE+3h56oRzrieiaJmw@mail.gmail.com>
 <17db4c46-d0f0-4e79-bf17-0e4c65ddcf83@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <17db4c46-d0f0-4e79-bf17-0e4c65ddcf83@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX+aviTm5SIupt
 anlzOZT26MH+Q5GulsDPUGzeAyb1UaWXh8UyCX13pF6qJe4E4VjhIBcV+lUUyucVvqPJ2bcaw+Q
 k18TuFLGOBNtDr+/NornFor20ThLBhi6piPMgT6eFRxpB6Iu/lc7AFjqb9y4gxfPhCXKcxjz7QB
 RiHdmU42hZN3BjcEm5dEnQPSUxuSJwO1FUYLoAQghXtiYKv7yKobAYhtr+f8a4QO0UKYYglhxyb
 u1LmuXsj0z8egBtjM8WufJhj8DlhIBEyOTi2YmpeG6Xv0jzVLmOyrwulS72UuVrC00fjn9dVrNi
 yk6TRe8CLp4EfYXeisi9Qf5FhFieEm2fmrNeHo/wtz6Lq7hmhgDHSTg1mwfVdhS9nyqIQgpTXtO
 r63loE29
X-Proofpoint-ORIG-GUID: 689559zEzZXrHMfh7HAw-NaH_nfbQpev
X-Authority-Analysis: v=2.4 cv=I85lRMgg c=1 sm=1 tr=0 ts=68ac3246 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8 a=YtvRNYmEV1LbJVOINMcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: 689559zEzZXrHMfh7HAw-NaH_nfbQpev
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230032

On Mon, Aug 25, 2025 at 05:36:24PM +0800, Xin Liu wrote:
> Hi, Josh
> 
> I'm sorry for the issue. I have fixed it on the latest 819-cdsp branch

The branch contains both old and new commits and a stray merge commit.
Please push a clean branch having only one commit.

> 
> Xin
> 
> On 8/19/2025 7:50 PM, Josh Boyer wrote:
> > On Tue, Aug 19, 2025 at 1:50 AM Xin Liu <xin.liu@oss.qualcomm.com> wrote:
> > > The following changes since commit 72a326cda49109765396e08f2453c51a852e3ec6:
> > > 
> > >     Merge branch 'robot/pr-0-1755548398' into 'main' (2025-08-18 20:29:21
> > > +0000)
> > > 
> > > are available in the Git repository at:
> > > 
> > >     https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 819-cdsp
> > > 
> > > for you to fetch changes up to 3611a33e984859def7308c94db9c29bc39e91a94:
> > > 
> > >     qcom: add CDSP firmware for qcs615 platform (2025-08-19 13:45:33 +0800)
> > > 
> > > ----------------------------------------------------------------
> > > Xin Liu (1):
> > >         qcom: add CDSP firmware for qcs615 platform
> > > 
> > >    WHENCE                |   3 +++
> > >    qcom/qcs615/cdsp.mbn  | Bin 0 -> 2774548 bytes
> > >    qcom/qcs615/cdspr.jsn |  21 +++++++++++++++++++++
> > Your change to WHENCE has a weird File suffix:
> > 
> > + RawFile: qcom/qcs615/cdspr.jsnFile
> > 
> > This causes check_whence to fail because the file name is wrong.
> > Please fix and resubmit.
> > 
> > josh
> > 
> > >    3 files changed, 24 insertions(+)
> > >    create mode 100644 qcom/qcs615/cdsp.mbn
> > >    create mode 100644 qcom/qcs615/cdspr.jsn
> > > 

-- 
With best wishes
Dmitry
