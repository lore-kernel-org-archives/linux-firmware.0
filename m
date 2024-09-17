Return-Path: <SRS0=/0NN=QP=quicinc.com=quic_akhilpo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C9EC35FEE
	for <linux-firmware@archiver.kernel.org>; Tue, 17 Sep 2024 08:03:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8434FC4CEC7; Tue, 17 Sep 2024 08:03:40 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 60105C4CEC6
	for <linux-firmware@kernel.org>; Tue, 17 Sep 2024 08:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 60105C4CEC6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48H5jCPm022178;
	Tue, 17 Sep 2024 08:03:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LvbBWrsiGIYhO96i+cXBfmc4
	/PmRTphe22qERmtzppE=; b=oRFpEezDFi78MPQU1rjlTTNHFyK2Dk9EqcJB4dws
	LkH0v9z70DPAoYjBaE5ZF2Me2mSNjxyJCGD2rVYsUa7gw/J6ghLvw/5V8oxqGz83
	S1tWno4+3zqOtOjIfTw/fN48rrx/AGJJJczsSuSPXxtAXcKQlYKDDwye3w6F7bEV
	pMm5M8tQV5juuFpJHsL59tQpF+CPc8M7WgYhRhF5n91HA03UGrfKEFfk9m8AKkrP
	vzkElr3mpEhABjYZDfHA34Tsg5lCt3DKwPXc+MzKhG5jXJGv7FDYTRvTu88941z8
	o9HP2Y9Huq2b2/sVPBw+E4MiJXup128mLs/hkV7iBdyb8w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4jdp77e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Sep 2024 08:03:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48H83VFe001361
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Sep 2024 08:03:31 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 17 Sep 2024 01:03:30 -0700
Date: Tue, 17 Sep 2024 13:33:26 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: <linux-firmware@kernel.org>, <quic_rajeshk@quicinc.com>
Subject: Re: your mail
Message-ID: <20240917080326.vpks3w3dmhgn5aiq@hu-akhilpo-hyd.qualcomm.com>
References: <20240917071016.gp43cuysm4kdznzx@hu-akhilpo-hyd.qualcomm.com>
 <CAA8EJpp4tGH_v7z9Um7Y+xxWPyFFMq4P3-cytNSJe3dqhLD_OA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAA8EJpp4tGH_v7z9Um7Y+xxWPyFFMq4P3-cytNSJe3dqhLD_OA@mail.gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Yo_8YrJXy2q9F82Ru6Y6tivkIznLPl1v
X-Proofpoint-GUID: Yo_8YrJXy2q9F82Ru6Y6tivkIznLPl1v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 clxscore=1015 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=269 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409170059

On Tue, Sep 17, 2024 at 09:24:19AM +0200, Dmitry Baryshkov wrote:
> On Tue, 17 Sept 2024 at 09:10, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> >
> > The following changes since commit 6c88d9b8253b8ec6df701a551a56438ea2e5bacf:
> >
> >   Merge branch 'amd-staging' into 'main' (2024-09-13 20:28:50 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git gpu-fw-SA8775p
> >
> > for you to fetch changes up to 43c971bcd74d9793140a8fbbcc805204cb797f96:
> >
> >   qcom: add gpu firmwares for sa8775p chipset (2024-09-17 11:57:51 +0530)
> >
> > ----------------------------------------------------------------
> > Akhil P Oommen (1):
> >       qcom: add gpu firmwares for sa8775p chipset
> >
> >  WHENCE                    |   2 ++
> >  qcom/a663_gmu.bin         | Bin 0 -> 55892 bytes
> >  qcom/sa8775p/a663_zap.mbn | Bin 0 -> 1054680 bytes
> >  3 files changed, 2 insertions(+)
> >  create mode 100644 qcom/a663_gmu.bin
> >  create mode 100644 qcom/sa8775p/a663_zap.mbn
> 
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Sent it out sooner without a subject due to a 'Mutt' fiasco. Please excuse
me for the missing subject.

Hope this is sufficient to pull the firmwares.

-Akhil

> 
> Thank you!
> 
> -- 
> With best wishes
> Dmitry
