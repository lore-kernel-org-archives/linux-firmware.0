Return-Path: <SRS0=3+jE=GG=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE913C5CFDB
	for <linux-firmware@archiver.kernel.org>; Thu, 13 Aug 2026 09:50:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CEB8E1F00A3A; Thu, 13 Aug 2026 09:50:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1786614607;
	b=OdIZ/1okRyt8cOIbidCl6Rf7Dkm7mNImF/vAz40BWLt4gzJZ5BXVl74S57b6zHLqoIDv
	 yOMBJ9qPaRClZZRqt54rDjDfUTl2hBVwwaow5B+eVcj4/gRKCANq+04QSDx1DGPyAivsI
	 h96kQ2nzF/KwKifamRWBaqfivwVTwqMA9QG9Jz5aW2dWOmNc0Fmyt8KOzCCkLJBsUKUQY
	 qALUeXtIW/Dm4n5wX0Q5tDVHUx1GgsvNNlchqmigPdp+TXv1Ycifsktzt9fs1xHl4O16D
	 MJbbgBGjNCXtXEJZ+IoQ6RrcNUjBWDt0qqlamSbqTELv0w7u9pyVephg9POpRab7rAg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786614607;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OghxHCPnnYd8wj6y8Vv9NUAMDoEmXLIvsWoK2NLD2xE=;
	b=3ZOa1ewR5dOicAe4Rob5WqzV9EXjD0h7Ug2LVybGByCzX6ZSTfqwiz0dih5SpZbBEAOO
	 u2NcIWOD/kPfDkB6TgrH9UCTfxNg0URbGY+HZnGg5kial+2OpkbXnNjlXnig1J9b45HyB
	 KZEUyGJJP7qI7qyD7L23fuLk+iFEWm6eudHVOdlC2u7GKw9GYwSNJaeAY9vZvyWX+LJHG
	 khz7DRE1mZNmM77RoiQxE/k9zk8NiL5XhCcnI1l+J8RQC08pvfv6qYBose+Hw5vCm2Xo6
	 3mSoSPESunOQFs79zf0aCK39dccGuCi6l4eqO+ZLbpQtQBQkj/M/k+BVMbfQkvJxpYA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="aGjoHVA/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Trv18Wzi;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 378C71F000E9
	for <linux-firmware@kernel.org>; Thu, 13 Aug 2026 09:50:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aGjoHVA/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Trv18Wzi
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 378C71F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67D91tl52849575
	for <linux-firmware@kernel.org>; Thu, 13 Aug 2026 09:50:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OghxHCPnnYd8wj6y8Vv9NUAM
	DoEmXLIvsWoK2NLD2xE=; b=aGjoHVA/GaLpRdbaNp80ab2EzY0w3tKjhK8fSrkg
	EXMw7vKITuil/wo/0qcqdmjP4xYfw1QU5IkYgSVDqUACBExWh9sL3sUrysgxObFc
	RtUzSAq+XObNM1lxpKUDHE8jgrcWVt6Z8Tmn7mV5tJYXC35uhLaHmIFp4+LfgInI
	GbXTpX1sihCAPm0szj0Ps6sgtT1ONH0oUQS4FqlIR20yRuq/K1WwFJSOD2ntKVvZ
	zv6vJmQ+7RSGD584XIkDVnH22DQUJDoB0lbazrdN6l6mKXdWuFIS/9erOtgOIgke
	rXTkMqVPCdad7sNmUy8uqcoontVOwy9Qkz+4M45c8Gme3w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g18c5gxpk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 13 Aug 2026 09:50:06 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90410c668adso19521186d6.1
        for <linux-firmware@kernel.org>; Thu, 13 Aug 2026 02:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786614605; x=1787219405; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OghxHCPnnYd8wj6y8Vv9NUAMDoEmXLIvsWoK2NLD2xE=;
        b=Trv18WziXlvYOv8P6A20Ec2kfXcxpWBwKErL24Aiwsa1tu3zd6hX7bytIRKtBgZE5+
         4AzFvDqOlq/FxeofOJ8yrrTJ8K79R6vVBNfFiKIbkyh2x40sgUeHSDZEKZ3rrhKGUeY4
         pmQegBkkfE2GNMzlGzgtXuWeILwoYiIHRxOZku3v+rUthjHGRkMRPE+/yhQ/QZOWkUHm
         Z1zLj0/CEacUoFKX9MY07bVxgfToPtnYKZY0jbBZJ3oWuz/Bdm8eYMHtdXVLPIJa2Adt
         Q2efDZsjNiaQlH23gUZ+9OmiYJRnxUgQdJb1lc6uA5pdgWTv4Vl2XzBUJFvBiSeaV+Pg
         X9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786614605; x=1787219405;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OghxHCPnnYd8wj6y8Vv9NUAMDoEmXLIvsWoK2NLD2xE=;
        b=c3mrGr1JCGmoIbKJn6NaFEs206ZGGuQ0GytPoxHElUqdtT9Km00+H6Dnw7dWwEbkiX
         m2Hsv3Qe8k9j9D2u1NI6Wm6pUpfRD8zfq0QK8xba/IMGFHXEfSCBwFki+Lu34LUVrJkq
         jMqVEhsehwDdQRRKOqGf//TJxvFGVW6PX33Lui4tNZ6IU/7I+gi+KCp9eU6n/OuOaWSQ
         F8jg4yE9KgjLoj8B/09VF29cdD8tOGQgF0BIWZH4rmdvuBrJ/eFRb59pWxpSgXJ1o8Q3
         P6qEciJTL31TqIXcVir4IsHIivoARlb+Ac2cXjdxfMnIzR4DclgcM2ZTw65xBRGqyDhi
         figg==
X-Gm-Message-State: AOJu0YyamQi5b6RnfBwiSYiBQdnsbf5DAFXkIuU3eXg1Yn0yibePI8V2
	JDD3l4rpvYDohu0CoI9xlBFXSGaVH1upioSjvO5mhTyn22TMvR43RgKc6NEkBKziman75QCHvHX
	uDe+FKLmCkFq3QKcqTx8i9z0/M97gnnhkMz/gd/Yr7N2W1WgNrcCyOsOQoqIXJ8k=
X-Gm-Gg: AR+sD107H0eizbooxRngAGLvbTMFNUu0mJWJCet1Jheu6Y5eqb4oGpvvtBtwR+bLc+1
	N4e7RXW7eCWoufLoylMvrIaZZ2UGh0eM3TsBBjVHa9im88kug8h0QmQFnmDoIz2WHZADid+cgjm
	3ih6RK6Ee0jW1trRBP7NAO5au7csq/+ml5iUh7BswFhv6gwys6iHkrcKZHD0IhoDYsknQTkgazY
	Xlb/ZewGav8Hp2JOHD4Hx9u870Dbq7Ex7KR8gulgA4dfxsLaQThut7psXT3YiTKd7a0XgTqeO84
	nNtJ6RhtFyMgiprDIruI4PKOZH8uOdw4lQ9XWGklwLlxKiSlx+4B9ZBUi3Fvhr8eFyWbNUIsA/E
	GmCPyS9SMt3Jxu+0t52jeOQRaep3109uyyXFfN/faGAG7VSBbmyD1jlNTzqIiNTRoK75dOq8A78
	HJuYB1PdXxKXse
X-Received: by 2002:ac8:5907:0:b0:51c:92a0:b2cb with SMTP id d75a77b69052e-52d73d88409mr41630291cf.26.1786614605345;
        Thu, 13 Aug 2026 02:50:05 -0700 (PDT)
X-Received: by 2002:ac8:5907:0:b0:51c:92a0:b2cb with SMTP id d75a77b69052e-52d73d88409mr41629871cf.26.1786614604776;
        Thu, 13 Aug 2026 02:50:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a11b402542sm3676501fa.29.2026.08.13.02.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 02:50:02 -0700 (PDT)
Date: Thu, 13 Aug 2026 12:50:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, psaddam@qti.qualcomm.com
Subject: Re: qcom: add NSP firmware for nords platform
Message-ID: <3qw35vkk4cqdop2resye6hirjjnkxrk7ceb3cctckpduu47vsx@dr4f3g6jdmbv>
References: <0cd244e0-868a-4cb8-bd0c-fc2ff029b91b@oss.qualcomm.com>
 <frgcq2r5bogzqtv2ft62btse6ns5iy3s6lfebes5iskrposcz4@hezpjlc4wgmd>
 <2c91a37b-77d2-4894-bb38-e6dfcc882f36@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c91a37b-77d2-4894-bb38-e6dfcc882f36@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA2OCBTYWx0ZWRfX3Y3JkzdU/WxL
 JPHU3k88ZKScYQ181LNfB4WQ0Vc78EL3mwSQQcSHsJvIT9w1plhF/RSkGD5v+Ob0ku6pcC3FJJA
 LC72zqry9hq5VKZpweLIzsldCJTC6wA=
X-Proofpoint-GUID: bI1MWWrza6Esuy7ISY-Mc8-7dp_guEkl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA2OCBTYWx0ZWRfXxsT9UJi4HNIt
 QGILjBkvcTzjQbRlRvQxVGFYJD9+TTJB/cQAKbnxjObrkWqvxiyrNYhHgkoUTLpBAFBVtmduwe4
 hSGBV1vkVuMa4rMM6VgimqtVSYEnjJKwe1opljr3D5EP8qDa1jI8h4S78Gaj5xQcIqZgHqoq0Q2
 UBn7TRQKzfdL5Y2wCOHZVKWmgw48im9YkTPiDT+TVVDlC4UlGk9Oe+uq7HHxrf1uoS1t2PBD0fF
 lJITQVXIG6z+7G7m72BuwjGchkjyCT2aPo0Z60u088ia1D7U2UHeArSuJvJi0qJhd16RvGkB1YO
 Zn7KiqQhQaxUH0h5949kGVUex/1hfr9JuSaI/iV9NEZHIufLWW7UQkehscPj9H+GNid7aATnhT6
 UHoNNz6zJRzt0dTknNJ3Md0TUUQxj18I2Jnt3ZqvjcWcBQQdFvZJtEt5QmjYbKSOnSc+q68hRLm
 ekhQSlZN2gpGcMoxQpA==
X-Proofpoint-ORIG-GUID: bI1MWWrza6Esuy7ISY-Mc8-7dp_guEkl
X-Authority-Analysis: v=2.4 cv=VebH+lp9 c=1 sm=1 tr=0 ts=6a7d934e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=qC_FGOx9AAAA:8
 a=F1e8KRXIC8iz2vcYoNYA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608130068

On Thu, Aug 13, 2026 at 10:16:57AM +0530, Venkata Kota wrote:
> 
> 
> On 8/12/2026 5:48 PM, Dmitry Baryshkov wrote:
> > On Wed, Aug 12, 2026 at 10:53:27AM +0530, Venkata Kota wrote:
> > > The following changes since commit e3c0c4b70f50ae77bea557b4a44be04413d3f3ed:
> > > 
> > >    Merge branch 'robot/pr-0-1786456716' into 'main' (2026-08-11 14:02:21
> > > +0000)
> > > 
> > > are available in the Git repository at:
> > > 
> > >    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > > dspfw-qli-nordsnsp
> > > 
> > > for you to fetch changes up to a31906642ab7a73f5759e2c554fa2065ca548c5e:
> > > 
> > >    qcom: add NSP firmware for nords platform (2026-08-12 10:48:05 +0530)
> > 
> > Is the firmware for those instances that different? Can we please have a
> > single binary for all four CDSP instances?
> 
> The firmware is not different. However the signature on these images is
> different with each image having a different SWID. This is a limitation
> coming from TZ at this point. There is an FR93715 on TZ, to be able to use
> single signature for authentication. This is TBD on future targets from TZ i
> believe. Till that time for our QLI meta to load this image on available
> NSPs different copies needs to be there.

What is the ETA for that? Will we fix it for the lemans targets?

Having 2 pairs of images already was questionable. Having 4 exact images
is a definite overkill.

> > 
> > > ----------------------------------------------------------------
> > > Venkata Kota (1):
> > >        qcom: add NSP firmware for nords platform
> > > 
> > >   WHENCE                   |  13 +++++++++++++
> > >   qcom/nords/cdsp.mbn      | Bin 0 -> 3347164 bytes
> > >   qcom/nords/cdsp0r.jsn    |  22 ++++++++++++++++++++++
> > >   qcom/nords/cdsp1.mbn     | Bin 0 -> 3347164 bytes
> > >   qcom/nords/cdsp1_dtb.mbn | Bin 0 -> 131072 bytes
> > >   qcom/nords/cdsp1r.jsn    |  22 ++++++++++++++++++++++
> > >   qcom/nords/cdsp2.mbn     | Bin 0 -> 3347164 bytes
> > >   qcom/nords/cdsp2_dtb.mbn | Bin 0 -> 131072 bytes
> > >   qcom/nords/cdsp2r.jsn    |  22 ++++++++++++++++++++++
> > >   qcom/nords/cdsp3.mbn     | Bin 0 -> 3347164 bytes
> > >   qcom/nords/cdsp3_dtb.mbn | Bin 0 -> 131072 bytes
> > >   qcom/nords/cdsp3r.jsn    |  22 ++++++++++++++++++++++
> > >   qcom/nords/cdsp_dtb.mbn  | Bin 0 -> 131072 bytes
> > 
> 

-- 
With best wishes
Dmitry
