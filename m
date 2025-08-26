Return-Path: <SRS0=c4eW=3G=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18080CA0EFA
	for <linux-firmware@archiver.kernel.org>; Tue, 26 Aug 2025 09:31:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D38A7C4CEF4; Tue, 26 Aug 2025 09:31:43 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CED34C4CEF1
	for <linux-firmware@kernel.org>; Tue, 26 Aug 2025 09:31:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CED34C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q7o2Ai011572
	for <linux-firmware@kernel.org>; Tue, 26 Aug 2025 09:31:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wT6MrMdDiZ4edw7hzTg0GmNjJuUONviJCGznzWc9Usw=; b=C87/wR+tfWu2Z6eT
	eOmLfn4yI2Z5VmN4iRA95YM854gfNYnYoziSHwq1I+rzZSX5UVc0W410hEw32ltt
	iBB75U4OiPdKrECpGtGr3RPhbuNNnm1ZTfIsYucA3DC1OmFdAito9YLDnVO2iBOJ
	ea4pXJvRnwqTOn+72MWWKLrEqXnyPct+O6yLo8aBDkXO24f45ZUi4we0efX0vz9t
	yR0MxCSDMMjU/UXtOoiiEcS36kGdKk0gZdonhLBeVMOwiLgiDEPNG32B7hmZuE1x
	KNPF2AVY0fe/GlU/OHzerFTQDxjMP8PlFDY6j4elGqiyGB4ExaIFUcNQOe2F2CEv
	w0jVxw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q615g5sd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 26 Aug 2025 09:31:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b109ab1e1dso215099241cf.1
        for <linux-firmware@kernel.org>; Tue, 26 Aug 2025 02:31:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756200701; x=1756805501;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wT6MrMdDiZ4edw7hzTg0GmNjJuUONviJCGznzWc9Usw=;
        b=Og4pIT+cMyty759iczE1uvhg/xy8YXb7XkNgC5WzChabMfB628+hl+8vKH2WGqk3II
         C0eZD4lziMNCFCURTilw5rf66SeQBvrt/FLoFKyb/nOA0sW7F0ABPEOTDPA7bXLtN+eC
         dTc8to//GkJ8TsRrId3lpOiUmihLt84mqTuOSE2VfvrCCJV65xOTGT2TlX3z5hpRduTd
         wmONJXD46i0sdUDRW+JK5jXyNJZ8VrmjS99QWHiDOLUm4RIMgYY4HgFFWAJ31P1E36fK
         PGMXKNj3AKJ/5+PB5LfRDmzOHNOShq5jAoVhDJdn775KvVEM//Gl4R0JSkLxQWdYwVOF
         1Ciw==
X-Forwarded-Encrypted: i=1; AJvYcCWQfrnW7a4OExzsp8QbygpjFhXrNHXxROiOSD2vX7lGLu6gCxykDcxUspfHVwkZBla67nuX2BE+0L4qp4yt1A==@kernel.org
X-Gm-Message-State: AOJu0Yyzeoie2LTr2fdq3Jyf4yuDtIYrxd7cwmKu46n+69Zp6ARHs+nY
	RrAb4+xlgvXJ44U5gsQs0T9d+xontawRHoC5OOul3XgE58w+JwneF/BSplQRHAMVbCd5HCb2kN0
	6ukOLwUI2c+UH5mEgKBD1zQd34hucSWX/B4IDHjPKNXbadVpWH05WTQmrOxA+TuU=
X-Gm-Gg: ASbGncsG8kFhghlFlOUdOgo4UUc/x7MyS+a2NeJNFa9CJwH/2RbIQ9Tgpkvusj+ahwI
	jChCw4xhSN/HpN4AzQ5li56Crc2NlkhCsQnJcRwZv69xIwcP6lkcZr4mcrQMGVQNHtgBT2Yev5J
	SeghdhqrJhI58kObOPx+LLPS7R8OiJsJWyStPfmHQQIPtnPZig+y4HHv/TNPEIL5VXn4QIWAts6
	Afqrcldf6fi+92O4T4XEPrjJXjuZaCIl9szdyFa+ivyksou6wo1mmJP2v6XUWS573SnNjjNPv+0
	4r3V3yRlkt6xUP2Lkta4QEAXSs4fbNkP24B9OEP31X6R8H7oIcjvZCSzxSKLUOw5Gd9MS1DRe9x
	4mkm8EKQlKjLsI2aVNOA4irp7PkVyXTuZL0sVFr4VVNglhOTmXWPA
X-Received: by 2002:a05:622a:2615:b0:4b0:75ed:bbf9 with SMTP id d75a77b69052e-4b2aaacb9dfmr171854541cf.33.1756200700657;
        Tue, 26 Aug 2025 02:31:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJwabADXwpq1LaqFq52exOyNH/Mq9XvYLVd+SqtqIeppNTHVAKVlPNJX6R240xFif+lSeIgQ==
X-Received: by 2002:a05:622a:2615:b0:4b0:75ed:bbf9 with SMTP id d75a77b69052e-4b2aaacb9dfmr171854351cf.33.1756200700005;
        Tue, 26 Aug 2025 02:31:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f49af0439sm742683e87.109.2025.08.26.02.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:31:39 -0700 (PDT)
Date: Tue, 26 Aug 2025 12:31:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xin Liu <xin.liu@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Josh Boyer <jwboyer@kernel.org>, linux-firmware@kernel.org
Subject: Re: qcom: add CDSP firmware for qcs615 platform
Message-ID: <ppe4a53uubd7lsl2tk7ua7epbwmbybyt4tbcfexowrdh7oh3lj@arwyv25hkcer>
References: <4364ed17-0d85-4bf5-b1f4-7cfec60d6859@oss.qualcomm.com>
 <CA+5PVA6_-vuvwhAAZ3p98aOYyTfdQLishE+3h56oRzrieiaJmw@mail.gmail.com>
 <17db4c46-d0f0-4e79-bf17-0e4c65ddcf83@oss.qualcomm.com>
 <hx4l4h3bn36kxt2vsjm2zcrv3ho53e42qj6v6rtd5ub3ox3ekk@lyldagrlapsl>
 <ff0ee75d-a26b-4fa0-a04c-2c5ef3194241@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ff0ee75d-a26b-4fa0-a04c-2c5ef3194241@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfX3xcrGfd3S1Yx
 cCTlRTdsmPq53i4RHV0jtidbPV3D9NUMTzeHZMVrYxAwQG7h7pbAVXrsWMxHOBfya4pR1/Pio0q
 uMHbTIuslIFob0tEuWjdrW0HtrBE1ICavTs6i80v3W+3zhfpYEUIs1FV/qgQ1jx/Jgme/ZTJ6xM
 DfKZmeGvmCFTn1e4/2jlQPGWNX3k4iPKd1SXRVVtEEmfJTVJjh9mbC0XCfv1tKqL+qQVpUVGyYP
 rcwpXXefKZzOlB4mbP/pQLBoPXxK9brLD1GR7Rg3bEorWjg+UrzhFiYLJLMLsNliEMIp8PUGtfS
 WWkdmSYConHew9G4OpGuCsdQgUp/bBWgQVrIpskVZ3VzDY44hVimkEJfvKVBX/wj1b9pxu1utBE
 DV0Gsdmq
X-Proofpoint-GUID: OzYTV3RQAGtHuQydZZCznT9t0ylB5W1Y
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68ad7efd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8 a=0L3JsRNgBvT0HALkGpoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: OzYTV3RQAGtHuQydZZCznT9t0ylB5W1Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230034

On Tue, Aug 26, 2025 at 11:21:44AM +0800, Xin Liu wrote:
> Okay, thank you for the reminder. I will do it.

Please, don't top post in future.

> 
> The following changes since commit f044bc789f8e7a4427593b687801644c39e3e8b7:
> 
>   Merge branch 'amd-isp-staging' into 'main' (2025-08-25 18:22:13 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> qcs615-cdsp-826
> 
> for you to fetch changes up to 49524f3ee32837eee83bcf7fd3798967e764699a:
> 
>   qcom: add CDSP firmware for qcs615 platform (2025-08-26 10:24:34 +0800)
> 
> ----------------------------------------------------------------
> Xin Liu (1):
>       qcom: add CDSP firmware for qcs615 platform

LGTM and the issue reported by Josh seems fixed now.

> 
>  WHENCE                |   3 +++
>  qcom/qcs615/cdsp.mbn  | Bin 0 -> 2774548 bytes
>  qcom/qcs615/cdspr.jsn |  21 +++++++++++++++++++++
>  3 files changed, 24 insertions(+)
>  create mode 100644 qcom/qcs615/cdsp.mbn
>  create mode 100644 qcom/qcs615/cdspr.jsn
> 
> On 8/25/2025 5:52 PM, Dmitry Baryshkov wrote:
> > On Mon, Aug 25, 2025 at 05:36:24PM +0800, Xin Liu wrote:
> > > Hi, Josh
> > > 
> > > I'm sorry for the issue. I have fixed it on the latest 819-cdsp branch
> > The branch contains both old and new commits and a stray merge commit.
> > Please push a clean branch having only one commit.
> > 
> > > Xin
> > > 
> > > On 8/19/2025 7:50 PM, Josh Boyer wrote:
> > > > On Tue, Aug 19, 2025 at 1:50 AM Xin Liu <xin.liu@oss.qualcomm.com> wrote:
> > > > > The following changes since commit 72a326cda49109765396e08f2453c51a852e3ec6:
> > > > > 
> > > > >      Merge branch 'robot/pr-0-1755548398' into 'main' (2025-08-18 20:29:21
> > > > > +0000)
> > > > > 
> > > > > are available in the Git repository at:
> > > > > 
> > > > >      https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 819-cdsp
> > > > > 
> > > > > for you to fetch changes up to 3611a33e984859def7308c94db9c29bc39e91a94:
> > > > > 
> > > > >      qcom: add CDSP firmware for qcs615 platform (2025-08-19 13:45:33 +0800)
> > > > > 
> > > > > ----------------------------------------------------------------
> > > > > Xin Liu (1):
> > > > >          qcom: add CDSP firmware for qcs615 platform
> > > > > 
> > > > >     WHENCE                |   3 +++
> > > > >     qcom/qcs615/cdsp.mbn  | Bin 0 -> 2774548 bytes
> > > > >     qcom/qcs615/cdspr.jsn |  21 +++++++++++++++++++++
> > > > Your change to WHENCE has a weird File suffix:
> > > > 
> > > > + RawFile: qcom/qcs615/cdspr.jsnFile
> > > > 
> > > > This causes check_whence to fail because the file name is wrong.
> > > > Please fix and resubmit.
> > > > 
> > > > josh
> > > > 
> > > > >     3 files changed, 24 insertions(+)
> > > > >     create mode 100644 qcom/qcs615/cdsp.mbn
> > > > >     create mode 100644 qcom/qcs615/cdspr.jsn
> > > > > 

-- 
With best wishes
Dmitry
