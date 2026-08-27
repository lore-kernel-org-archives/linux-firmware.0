Return-Path: <SRS0=ZRYJ=GU=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB44C61DB9
	for <linux-firmware@archiver.kernel.org>; Thu, 27 Aug 2026 09:38:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8A6311F000E9; Thu, 27 Aug 2026 09:38:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1787823488;
	b=LdhQ/gJmu1sVLO6oc6CzkbDDn3afOJ5nqGMABCsZzumYaYGjxxbYB8M9Wyj6G7DtFsVE
	 KKxjgJHYQt04EOP/DdbgAWnz6da5pRpQZv00ApW7VcY4VOBsqtW5E+8+yORJI41nlcJd8
	 LS3MLYpLMUNdc1cS10IHxCEYF0awl2PbxWMCSB84zEZ/Pfe5u6b4kPflV+bK1V50FaZIf
	 8QSIcrChdx6n4hXoA1nBYFSsaZ1YkxJeX+Q+NuYpFPRGFcOaV4PlGL7zk/VfKw03vKLIG
	 7V4jJMDpxJYO+6//QaMmt2LpcPNvbBkWD6JnG5YgCwNVieOca57YX6zFGDEC5JvrUpA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1787823488;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:List-Id:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=spTU9whRfQ/QObE99bkkGbQiDZW9JH4BXhHpTGIRMDc=;
	b=Zeyk47vezP3kMmrQqeRt5AL6Dsuc2MiqogakrU+Y2VLFvtooeF5nQhAPNp7VGDlCFG8r
	 v+mmzB3bLA3D5w7/Rc5lCLulGjArOsGydtoqxOITWG/HCwbhpIAM1l5Nc4Mtw7W1alpUr
	 J806fjHqn+tX+MlRFfiowo4NiNU5Tf97UtX/OKowYqiD3tYF3QzkgziEBNKKc4DdYMINy
	 C93q7b1Oe9zxVUQeqd6z3dssJD5QsAfO+RXwt4RE1EwTD5bTXrE++jOLIm3BFsBRjYb9F
	 hUVpeHCVU9dqQFAlBkJZie+8/XH5ildeO2i1d1Zd+keJ/QW7Z0/Rdw9LmCy+gCi5mNw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O3o2bhFo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gS2uooue;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C51FB1F00A3A
	for <linux-firmware@kernel.org>; Thu, 27 Aug 2026 09:38:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O3o2bhFo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gS2uooue
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org C51FB1F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R9HG0Y3421712
	for <linux-firmware@kernel.org>; Thu, 27 Aug 2026 09:38:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=spTU9whRfQ/QObE99bkkGbQi
	DZW9JH4BXhHpTGIRMDc=; b=O3o2bhFolkSq/p0p43z4J9UTfalS3sx9dPqUAVWb
	NxLCmRyOZ79NtABgO/tUUfG97WyJScaDAi9xZzhmQkMFIMZFroV+9ZFnF/yNXG5K
	O/xG3Gjj9XXeiuLHVWhSNrWWmfk4HcS9rpp/T801vZPzP6qa9Zno6NSdhi1qsXT6
	+vAWDBkJWIJt8kUam21waslA9dGBTAnWFSH1AaQYPpeBhZaIbYhXN9rTFMIkJSmD
	YUswO5jxCcblRnmcQniwPMMPvix+/khfWo+B9yMHQZjOHslOudzJguVipsPcHFXT
	MWOEsEE5Ueak4FUA8hk0wXWE2lI3nq7WMtu+V1yNI7/irw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga03ac9gx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 27 Aug 2026 09:38:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52dd69b00cfso5873301cf.3
        for <linux-firmware@kernel.org>; Thu, 27 Aug 2026 02:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787823486; x=1788428286; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=spTU9whRfQ/QObE99bkkGbQiDZW9JH4BXhHpTGIRMDc=;
        b=gS2uooueh9CkT7OhUpzJcnLGkey1g0UpNEohCmMEOB/hh869v4VcbNLxaxQzg+/GOy
         0TYfasOi4PiyBRSKB5KmFO1NcdFktuk1HgpPwUkqvNwqMcbd3LuWC1nZ4yt/sXKIGwtS
         7P0Cm5jN9rtw6DrpnF7gx9au6Ewow7d7273i1I75bbM0nl2uTpqwETTvFTgkXqoJKaNM
         uapDM/gh+Mn2fVVndJ8hjC5tOxRnaOhzMEQngvxYDjWEroT0Diqbt6Plh9KaE2C6Y0JA
         XMkVT3ltOT1Ctiv7HKRr22wQ3zvWkc1yee63h1ZPLVqi5CbyvEA3zF9NJAbY+n1lsn49
         kPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787823486; x=1788428286;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=spTU9whRfQ/QObE99bkkGbQiDZW9JH4BXhHpTGIRMDc=;
        b=ZolqtZ+oO1kRJzM4hp1yJ/xaU+ISAj4cfohr/Zx+mdVYlTOdamWJaT4qGzqKmV/zsH
         ZxlRqytgyq/AkYClpllOt0ud8btAYyReaDmXt8gsNB/Yiah47kr92Qpa1ba+Q4hZhGOS
         vZevRLuAG/zJIXSKyZ6l2AD+xcAzE/G6XdpcxNnavBSu8+6TUI4hTzMPeXhwEw7Zc1qO
         XaDYtfuYSIXmGPzbYpC/PIYNixVgOiHR1jBXwVuHQnHtlJ7vluAorbLFPU8o7A57HmdN
         TLmcuHxN4gudDqE8f5JoW+FJ9Bea1wqIqr2gGs6VYgeqrsT/AwuYgbjfAnP57jNrYPVk
         ZlYQ==
X-Forwarded-Encrypted: i=1; AHgh+RpYDOybL9Y0EqRmsYbMwMSRY3rwOv/5gco3WoOlSEkOg5dZuhY+ZNRmZY2zDRjOMW9MjH881+tbfbrxNItoyQ==@kernel.org
X-Gm-Message-State: AFuF++lClSk03I+FZdW0de4HykJOCOosupb0FX0hFcVdYA/048/cJUJr
	tFCmpp9rr2WSSAQ+XF1uTXbpWmtpTd8BdeoIinUnuE/qExc9DWs6QRgusQbS5vRpat4btpDWWTl
	aQhwumlJfBYCcO3n1I7uBh0HpXb5cP7d+v89tJBJqEU5eEiSNtCiPt3OnXzVqYt0=
X-Gm-Gg: AR+sD13yVzKnrdhSAHo++RX10LwUpUHHudmiGGWiTDSDeEawbB8H7h6xbS6tpqZBB+4
	jCSaB6sSMmFFTPFMcZhwLMehyxYL75JPXB4wVipvDErpc8p2zSVi01jr5GwQfluXndvcjCH/7EG
	MjGwvaUDLk4qIU4DjNgSioZCxxoKIaVXjWV1zyDuLfXHCQlQX4c1sC8GCcVgS9JT09d4aCaa4U9
	DoDZ89Sp1j6gs4h86zCOOXBqwXGtOlz5ljRF9cfL54Qky/jwkLH1lD0w9l7ew/FKWdXkGoHdgWd
	CpDdfWoRPQOopzIFPRqANOkO+t5Jr82XMsnjxKvjdjPQEqbauAPL1gbgj4jg7g2thxkrovfh7WQ
	UDHYe7YUGp4KCXcqCrFs6b8w+hoD9KyJ1HeI0KcCmxpUWpKxWNQqH3WrNCudzHwEDc+1M/ZjE8t
	l9al3xHfptg2u9
X-Received: by 2002:a05:622a:a6d5:b0:52e:fb1b:b50f with SMTP id d75a77b69052e-52efb1c19d5mr103070061cf.35.1787823485882;
        Thu, 27 Aug 2026 02:38:05 -0700 (PDT)
X-Received: by 2002:a05:622a:a6d5:b0:52e:fb1b:b50f with SMTP id d75a77b69052e-52efb1c19d5mr103069731cf.35.1787823485453;
        Thu, 27 Aug 2026 02:38:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4a4153373sm1136267e87.10.2026.08.27.02.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 02:38:03 -0700 (PDT)
Date: Thu, 27 Aug 2026 12:38:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Saddam Patan <saddam.patan@oss.qualcomm.com>, linux-firmware@kernel.org
Subject: Re: qcom: add HPASS firmware for nord platform
Message-ID: <xqbenqkwbhftdq2omm4wibhbiohxdu62lbm46rfguw4vw4zlge@qduse22k3jzo>
References: <9198246c-7518-4c3a-b163-8b3ecc6292c2@oss.qualcomm.com>
 <t433xct7ravyod3y3cynlt4s7qkjha54732yvsguia3a3j4ncn@jgpyp3smfwmp>
 <18b58b9a-2fdf-40f4-96e0-fa732c5fbe4c@oss.qualcomm.com>
 <wtwyj7badkcgi4bkxgdqtknj5mvhsdawglnktflxbdfxxinr2h@rhfylwng3pcf>
 <d6092852-a53d-414a-a5a0-3dc0a96b170e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6092852-a53d-414a-a5a0-3dc0a96b170e@oss.qualcomm.com>
X-Proofpoint-GUID: QHmH6hEALNUWNiVUEB81K3d-RUvBQpiQ
X-Authority-Analysis: v=2.4 cv=VdLH+lp9 c=1 sm=1 tr=0 ts=6a90057e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=qC_FGOx9AAAA:8
 a=AktJeopgaO2hLLUq0mEA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: QHmH6hEALNUWNiVUEB81K3d-RUvBQpiQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA3OSBTYWx0ZWRfXyoOdgzinF5aG
 6n5AMsyN1PZpYi1J0Vk3azskTnGX74rt6breh0Or6gk6+AWr1XVCYeNk4p/hIxGhcTuN1h+s8nL
 UR4pEbF374qDlT3U4d16lLlCb5QMo5lV1qwlAM3SfquBkY6ZQDc/jkAuFqPlcyCOPkg/pBowpBI
 HeVPI1JDm72iffVTeRxyM/QAFL709+usMQ/Vt1/nljzSOf9ryE0g/1r0Zgu1nDeemFNZ5XYEVfC
 t1Lz/2NYK0S1naigV+JRm2vYPFNdl+tKek1cHnQYQ3J2yKKX0w8Ie71ODW6tVFxK3O51adZwZSZ
 yjH+JXDJjrksclUJ8CtGgNecM7AHzI6va2ynagWQ/hSgZXZuJra903aJkkVABjDWSKPWhiXwN6d
 shw6+kPA3Skg2Vac8D2KY1BJXeyQqmDPyjcULKiU/GlI8XJe+8MD8vy4Y9T+UyGhIioqs5FtmIG
 JgMfeyJUfvgUbUpGFoQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA3OSBTYWx0ZWRfX2Um8/8dfpGfC
 q0VT60QiUojSgDZbB9zXAY93MEgShy+ihTZlDdgUd+i/hJgks895yzqXWJvmsD/76zHTSwKo1ft
 KGYKghzpNO2MJ1i2c6HnECKyBDi2FtQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608270079

On Thu, Aug 27, 2026 at 02:05:27PM +0530, Venkata Kota wrote:
> 
> 
> On 8/26/2026 9:00 PM, Dmitry Baryshkov wrote:
> > On Wed, Aug 26, 2026 at 07:15:54PM +0530, Venkata Kota wrote:
> > > 
> > > 
> > > On 8/26/2026 6:17 PM, Dmitry Baryshkov wrote:
> > > > On Wed, Aug 26, 2026 at 12:26:38PM +0530, Saddam Patan wrote:
> > > > > The following changes since commit 01205307636157a12c29e6a774bf83b218732050:
> > > > > 
> > > > >     Merge branch 'sa8775p-fix-sig' into 'main' (2026-08-25 22:03:45 +0000)
> > > > > 
> > > > > are available in the Git repository at:
> > > > > 
> > > > >     https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > > > > dsp-fw-nordhpass1
> > > > 
> > > > What is the difference between ADSP1 and ADSP2? Do they need to have
> > > > different binary content?
> > > They are different binaries as they are not bit exact. There are few
> > > register configurations that were programmed different from the coretech
> > > side. Not sure what the history is with that. We are just pushing initial fw
> > > based on a CS sample of NORD Auto code. There is no new change planned on
> > > the same for now unless there are functional fixes needed.
> > 
> > We already have the DTB, describing the DSP (see adspN_dtb.mbn). How
> > difficult would it be to move all the differences to be DTB-determined?
> > 
> > Consider having a single image for two logically same units to be a
> > requested functional fix.
> There is a Feature Request to the core team to work on this. There is a
> significant delta in the split bins as well at this point. Looks like there
> are significant changes that have made in during the Nord Auto Program. We
> shall keep working with the team and once fixed, we would roll back adsp2.
> Right now they are different.

That would have been worth capturing in the commit message: why they are
different, what kind of functionality is provided by each of the DSPs,
etc. Otherwwise, as you can see, it is completely unobvious what Saddam
is trying to do and why.

-- 
With best wishes
Dmitry
