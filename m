Return-Path: <SRS0=BsXr=3F=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE63CA0EFA
	for <linux-firmware@archiver.kernel.org>; Mon, 25 Aug 2025 17:38:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E0D6AC4CEF1; Mon, 25 Aug 2025 17:38:39 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E2C6FC4CEED
	for <linux-firmware@kernel.org>; Mon, 25 Aug 2025 17:38:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E2C6FC4CEED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PG963I003698
	for <linux-firmware@kernel.org>; Mon, 25 Aug 2025 17:38:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WVxxpE9vHUupq77Enq6Cf/0h
	//0JqfsVpoKNxBZEFKw=; b=RMZfPnGJeiMq2lRKCDzxjksiqVnH30q7LUsDorZG
	DDEviPC4BmdgTjJ++0dbflTrzxltmFC+SSToxqgydoAg6Iw8ahmVzLOJeQ/RcMk5
	O3S9g4LRZnklujanXwEevbZ8AtApzAlmryFhPVaEv7fIod5NgjQ9HjHr8HRtWidA
	rT4O7o/DdkraB/Da77imuHqaJG/WtZUuzbsPrqUyDrJtg/DxILvIOasLFkn2koNp
	8UEQ7hd2vGk4G3m54q8EE3CrHCKE+w+AABvsEetYvfZ4WwcKD+aF9cAykSF9X9HX
	+S41PINPOCsoOCWvJXlIhL1kRwF21XTFVD46/xvQiS6THQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xfdyb3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 25 Aug 2025 17:38:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7f2942a1aa1so194191485a.0
        for <linux-firmware@kernel.org>; Mon, 25 Aug 2025 10:38:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756143517; x=1756748317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WVxxpE9vHUupq77Enq6Cf/0h//0JqfsVpoKNxBZEFKw=;
        b=HyBGQx6x59hJ3vSPNo42uThH4Z8dk8A8Zziwun/wuR6Lj+wcpRB4Gziitjo2eElL/F
         8iCvzCARju6ymOjecWKfzgCEAA8Ds66jrIs9K8pHsns4wWTS2ylFHX3QPFv7zjznrWVb
         2jgqJqr1PjaoZw/XL+13BRdSSDpHKZ/c++9Qanqu2C3dMvZiiOSyZgFWw42BCnS8Ta8E
         8bpMn8/K0QZ9H54YaYtaBHQ2M015dg8+b5qoVBqbxw0E/loavQqdEfzcTHcE3X1vW7qW
         /qPTgEz74Zy5u01rwZccOEA6nv44pCvXh4e7QM0jClqOUmN4RnkYNnoFtqEoJYOS15sB
         FBJg==
X-Gm-Message-State: AOJu0YwuIPKuQk5Y4V1Qtp5wnIoU2Au6LKlqgoqkKMeXKJkO66Zxwwam
	25X3lmfmbmIhQb5C1o3d7x9PHgMaywdjnCCxeQdjH8KES+J56MLqwzMi5JmqZprU7tSj90zczDt
	WPV1MVuywi8/dd9UL4HH0OHXSe67EjaSwU5EpbuD48piquJ87wY7GSeSbBlR+DEzxOU9Cvmc=
X-Gm-Gg: ASbGnct2ljS7r+6KMqU3APvf2DXg0KJKrba0cFolJhgdl9+jXkdsGca1ynijSnMvaFu
	lLsZpACEwENY3yykYCc/arkl9eaQgn9FzVelRH531xX3UKskLjbBygKcxIsF9186ldySn/x6Avy
	z4Lqt1aMjDz9i5VjC+ZCcZb68GGQxqpe5lrWcMIY79oz19m5dVDAZX5QaKYUpOUO03VcEBYPkA5
	igeLfvDMUUR9iNUzssyX2LzC9+moPG1lzkCkblrJSgMa5nb/LiVp6uJ7MpTQGxzwCXxm9/BQGPs
	llgx0QpUWjZivRvTDSPDXLo3lNC9/8qUIkUjpNPFNFSg0m0pUHu9m9wjFdDQxfYGsG5l6hVVxLi
	sNT1bAv/aiQMHkG+JKgo7eQbRXjGYqUPNX+CkWjiicNTPHSx5/7hc
X-Received: by 2002:a05:622a:1b9e:b0:4ab:958a:6003 with SMTP id d75a77b69052e-4b2e09ea79cmr5967911cf.27.1756143516683;
        Mon, 25 Aug 2025 10:38:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFk5QCkx86RFgP4QkfIjNk9hFJPkS7HcAOpiV/X763d/Zm+dou+lvn4UAT5vsZHK3seO4zSig==
X-Received: by 2002:a05:622a:1b9e:b0:4ab:958a:6003 with SMTP id d75a77b69052e-4b2e09ea79cmr5967471cf.27.1756143516009;
        Mon, 25 Aug 2025 10:38:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f3944c9a9sm1648826e87.92.2025.08.25.10.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 10:38:35 -0700 (PDT)
Date: Mon, 25 Aug 2025 20:38:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <vkasinat@qti.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
        Dmitry Baryshkov <dbaryshk@qti.qualcomm.com>
Subject: Re: qcom: Update DSP firmware for QCS8300 platform
Message-ID: <gwwnicejfqsy44iymxuhwhxbsw6uhwc5yzgjn6yssvqr4ul5j7@a3ccwltfubxx>
References: <IA0PR02MB99170EF1F67713EAE935DC41EF5FA@IA0PR02MB9917.namprd02.prod.outlook.com>
 <fbfhexyr6cslriwf5jekca6kya6uqdyyjf6vnkkm7bxiw56mlr@5h5eowusswij>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbfhexyr6cslriwf5jekca6kya6uqdyyjf6vnkkm7bxiw56mlr@5h5eowusswij>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX3+ZYFfwZ9O1v
 ZhwpplMjynOmRAIsAwS89GhTxsSn8qU0mdjY4yiZ0ZJXs4hnvX40Z9hplQNk+D2992tWXo7FWbI
 H2nUdKKgxp86S+YAz+atoOcFiPkJN0AT8v6tPjPZRpyxqHniUv9XkAK3bE3K27cwP2mww8yVz7y
 j5N7kgF8aAk0Isw/XAenx6b7QWXY6Uu5yD9EZWpH3pI5Ct8tAAnWPCm8cnQM5cJ6hDVCWRzclYy
 CRAzfE8mVs23SgYuotXy5P8QKQf+4QCFp4afY/v6job1R0neWXz4L2kZJUlypHNINJvNyTfP4RO
 vYX6mXI7IbiNwK8HkamT5RvhfBRIalNH4b2P+KL5rAzeLd7Z9Klt/iZO57JkYwc6fzpDIXJlmyl
 6F798zhL
X-Proofpoint-GUID: ESYnPyJlURtMKunx_Y6r8CwSAhyDVzXf
X-Authority-Analysis: v=2.4 cv=MutS63ae c=1 sm=1 tr=0 ts=68ac9f9d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=qC_FGOx9AAAA:8 a=TCPiLRFRhebh-z5OxIsA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: ESYnPyJlURtMKunx_Y6r8CwSAhyDVzXf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_08,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

On Wed, Jul 23, 2025 at 02:04:37PM +0300, Dmitry Baryshkov wrote:
> On Wed, Jul 23, 2025 at 09:51:32AM +0000, Venkata  Kota wrote:
> > The following changes since commit 04c379b552c7ff194e0840ede6a2997d7deac691:
> > 
> >   Merge branch 'robot/pr-0-1752559067' into 'main' (2025-07-15 21:06:17 +0000)
> > 
> > are available in the Git repository at:
> > 
> >   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git dsp-fw-qcs83005
> > 
> > for you to fetch changes up to e58faa78b6d6d88f0395bef769628d04e937dc55:
> > 
> >   Adding RAW Files for gpdsp from DSP.AT.1.0.1-00125.5-LEMANS-1 (2025-07-16 14:00:17 +0530)
> > 
> > ----------------------------------------------------------------
> > Ekansh Gupta (2):
> >       DSP.AT.1.0.1-00125.5-LEMANS-1 DSP Firmware Release
> >       Adding RAW Files for gpdsp from DSP.AT.1.0.1-00125.5-LEMANS-1
> 
> Please run `git log` and compare existing messages with your commit
> subjects and messages. Then update yours accordingly.

It was posted a month ago. Venkata, any updates? Do you plan to fix the
commit message and resubmit?

> 
> > 
> >  WHENCE                   |   8 +++++---
> >  qcom/qcs8300/adsp.mbn    | Bin 6643712 -> 6684672 bytes
> >  qcom/qcs8300/cdsp0.mbn   | Bin 3084288 -> 2629632 bytes
> >  qcom/qcs8300/gpdsp0.mbn  | Bin 5832704 -> 5873664 bytes
> >  qcom/qcs8300/gpdspr.jsn  |  22 ++++++++++++++++++++++
> >  qcom/qcs8300/gpdspua.jsn |  29 +++++++++++++++++++++++++++++
> 
> What is the usecase for havign Audio PD on the GPDSP?
> 
> >  6 files changed, 56 insertions(+), 3 deletions(-)
> >  create mode 100644 qcom/qcs8300/gpdspr.jsn
> >  create mode 100644 qcom/qcs8300/gpdspua.jsn
> > 
> > 
> 
> -- 
> With best wishes
> Dmitry

-- 
With best wishes
Dmitry
