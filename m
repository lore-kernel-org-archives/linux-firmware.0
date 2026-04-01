Return-Path: <SRS0=2Trv=CA=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66CD6D35160
	for <linux-firmware@archiver.kernel.org>; Wed,  1 Apr 2026 09:21:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 414C7C2BC9E; Wed,  1 Apr 2026 09:21:32 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7C034C4CEF7
	for <linux-firmware@kernel.org>; Wed,  1 Apr 2026 09:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7C034C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6319631a1459610
	for <linux-firmware@kernel.org>; Wed, 1 Apr 2026 09:21:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ILVxnBQCKQGFQjni4BX72M7E
	eqYWhh1C8/RFMAvgbXA=; b=QivnzS3AOoxoof7w4mCO6lPU2ULfSDxkYb6T7ce0
	2HGp+dexmFV5FCP2HESqY/MCv+SdTS23Np1zF3iNlcbiJVzTGiJoW+5qhtAyxzWs
	LjXJLmhKyVqyHNAvjIExPzZibxw5eHTTVpQjKOWX4N6h83ZxGhczLi8XdNbcbHRG
	BAZCkCnteYH7hOYhoRI1Z40hbg9+YwX6pK7P9rt6K1rb2/8eMvA/1OxHwjWFaIZF
	Y7AD0g5pVB+DZrbXobYMEw1nfWz6LEsILCbpkHpZ66AsFtCS+aDdy9UqoBgM7ZJI
	UjQEJL7i9dAgFBOy8DN4qs+QPUp+BysH5tzBNMLnxA4Whw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8uhg1bfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 01 Apr 2026 09:21:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd767c51efso684080185a.2
        for <linux-firmware@kernel.org>; Wed, 01 Apr 2026 02:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775035290; x=1775640090; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ILVxnBQCKQGFQjni4BX72M7EeqYWhh1C8/RFMAvgbXA=;
        b=FBkXY2knvsrP32D+NormGZIeFYiiJOv2gYWehGYBkY5KJ8rZ6p2DzidVWSYv3vOXVd
         riQjZOTLeAYgg/RCl1Q7CRYTl30rCi/4PWDVYLDSDs1zV41Cm0EUh+fQteojIOL0VhjN
         Uv3VMhZG9ElDkQff3C+lWTaneVUboV+tBCjQ5PZPFeJ8JbG9Mpmf9VBmAh+A+ZzjapUM
         LZTntiRt0abB6/kJFdyPRz8QNyULXIq9zy4JKV/LgP8chbS+yaWSqOSEzy6r92CuL9fG
         ZDB+LiULCzyAbCHDeht2rrOdx41VPv8V7A1wfNyDTHpRCiDs9xYk1/V/Mf/GPs3WOY6h
         3Kcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775035290; x=1775640090;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ILVxnBQCKQGFQjni4BX72M7EeqYWhh1C8/RFMAvgbXA=;
        b=FD81j78+ZuvZ1OElcq6Mr0AO1E3kwSryyVjfMS7FQQue5xj/tlRRgrg4OaAEwASa8p
         S1MbKvaZ1XKQNNT4T2vsuWTo4kpF4DnEkL+y5YYQ0/62oIpaJv2MjM5Td5vMIpId5jOT
         UnouTgU4340KYwSH4u2/x88uoMOcIvu3d492wYNunvmK/5l47n0vfpwWf0aNMy+UIUKp
         ixvM2GgejY+wuRfXziX6wJH2kGg2rrvX447upaNYrURiXHWIMiN1iM8uW39xzRwQQMhv
         rYzQsiDyyzotRG3yf1UFvYeOf7vYx0G5sFYTCelnLm6cpS6XcfeA9WSoMnB2LIrF18e2
         QZCw==
X-Forwarded-Encrypted: i=1; AJvYcCV6dvPQKFnLl+nW5SmpPHVeQwes7HBQLtUDfpcaW4ZLcezSxvlA06vwLjE9rscz1IvPaZYfBH+xBxAVEY/DCQ==@kernel.org
X-Gm-Message-State: AOJu0YzUVXVSq5bgL7WSo/EsQy0F52D8UOyVybE6Vzgi46oBQ42sMPDS
	CHBQlzYLzQmIFW310ErEDMCOhHjjHjloP8renspUecVAMuNH2Sg0mRRFd9q9P5K7+qqODOSczQN
	QHsEjXyHMs/28FZ5lkAoJjg8myUZGn/ToGeZD1sDGSArUxigxkb8p3wX8kzmEOMw=
X-Gm-Gg: ATEYQzxZGf5M5oVwIphjvpyjN9hiKKONx4cSAwcL5nGjf+IusLA13E8FZu9Lz6IQT95
	cyJhnBkx6qpX2Ki69BbPRiTslf2HA+aTAol0IBduJBFOyQNL4B7eeCmJm0LfyUh9s5HKuEgrPUG
	+90p+HOhy91fm3IkGiHI4FkRL9Bw9zJHiKLxPMYnjjIBjVMqrFyugXIS3DH/GuHUJ9UOdPOa9pr
	kHdv3oQbjE9bKo3WwJ9yI5oXNK/h3lvTt3exg/TVBxyjjDD9WRPdXgIBYsSMl85a4sbHsPPOlgN
	28Y9BUUizO778SAqlV+MzHRrhAk7hL2M+X++pJMqTF14ecXMly7zzWJyhDhG6QEs4IsRAsR9GI5
	2cU6G+1Hu4t9WFI9ZA7enR/rrhF+/3tTI5AiR4WsxjsXzWuU+R0/9xgAQdBKKu8Y6O5yISuCdSr
	UXai9i1QgiLTROVq+/5PiuT6OFaAlZujHT+Ps=
X-Received: by 2002:ac8:5a8c:0:b0:509:372e:35f5 with SMTP id d75a77b69052e-50d3bd571ebmr37289301cf.55.1775035289795;
        Wed, 01 Apr 2026 02:21:29 -0700 (PDT)
X-Received: by 2002:ac8:5a8c:0:b0:509:372e:35f5 with SMTP id d75a77b69052e-50d3bd571ebmr37288991cf.55.1775035289353;
        Wed, 01 Apr 2026 02:21:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1403c4esm3169956e87.26.2026.04.01.02.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 02:21:28 -0700 (PDT)
Date: Wed, 1 Apr 2026 12:21:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Saddam Patan <saddam.patan@oss.qualcomm.com>, linux-firmware@kernel.org,
        kssb@qti.qualcomm.com
Subject: Re: qcom: update ADSP firmware for sm8750 platform
Message-ID: <vzavddb4f3uvsqwbchcvkwqs5ddgsg5ffliufbocmnbs6xfmh4@4dj6lsufgn6i>
References: <e115ca3c-33eb-41a5-95fb-42d5767d474e@oss.qualcomm.com>
 <cgn3jvjyutddglx46kvckd6frqkxvlnx3i6qrtzyr2jggqhuk7@tnfevwujk2zn>
 <0cd00caa-a626-4d77-96f4-232db9e5fef0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0cd00caa-a626-4d77-96f4-232db9e5fef0@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA4MiBTYWx0ZWRfXyd0i2M/zbm40
 kWZjP8U8WZSlzlk6sKoBFuRE5dkWL4co1O+PEUzvKUtW2XJOp3lxU1AO19w34DES7G7C/wERNPK
 pZPbnroH8O5DIdk6WVUFn31c4BwqbLfWOfEe3UL/036dozhuCn+03ditzS+YVZp+lcb/2HFFDfP
 CXIRSRtHWUFPh3QYQpvqPwx8zqKFcLh96tAkgBjttPng3RbJcmialTbH0gt5iP14LCw6gaJ8OEy
 pEnTSQ/ppOz2KwzWCyWEZt1BRvUo6S6wo3k7LQmnD2B3k7nmEuaVfHVCdAj+4qC3zFCBKC7kz7S
 GjDPr/if0nntuTFyo4FMuiRntLO03ioNwT8dTt48HHAZ0EEpsMTYVE6aPFjzd7XrCw09pmfzoHt
 Slm/h8HPLYxZFOu3Bczc815D+xYGJ9EF4/lYlF3Gd9FInCHK4d9Ij3J6wdpAxQL60Ce3xtXw/jF
 NNyvnO+6dRJwuYeDGwg==
X-Authority-Analysis: v=2.4 cv=YcawJgRf c=1 sm=1 tr=0 ts=69cce39a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=qC_FGOx9AAAA:8
 a=A94-tRglnGrUPLQIwLUA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: Cz2LYyWdZIWGZu3oryP9YRkuCxv4Zu61
X-Proofpoint-ORIG-GUID: Cz2LYyWdZIWGZu3oryP9YRkuCxv4Zu61
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010082

On Wed, Apr 01, 2026 at 11:09:38AM +0530, Venkata Kota wrote:
> 
> 
> On 3/31/2026 8:19 PM, Dmitry Baryshkov wrote:
> > On Tue, Mar 31, 2026 at 12:17:21PM +0530, Saddam Patan wrote:
> > > 
> > > The following changes since commit 85786b4413fdc486e3bc0f4f6cfedce7802ed041:
> > > 
> > >    Merge branch 'amd-staging' into 'main' (2026-03-27 17:22:24 +0000)
> > > 
> > > are available in the Git repository at:
> > > 
> > >    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > > dsp-fw-pakala_adsp_18
> > > 
> > > for you to fetch changes up to 47fcef3409cea1043a33ae74ba1a98e55877eb09:
> > > 
> > >    qcom: update ADSP firmware for sm8750 platform (2026-03-31 12:12:45 +0530)
> > > 
> > > ----------------------------------------------------------------
> > > Saddam Patan (1):
> > >        qcom: update ADSP firmware for sm8750 platform
> > 
> > Why is the new version lower than the older one?
> > 
> > -Version: LPAIDSP.HT.1.2.c1-00450-PAKALA-2
> > +Version: LPAIDSP.HT.1.1.c3-00018-PAKALA-3
> 
> Internally, LPAIDSP Image team has created this branch to support all QLI
> and Upstream on Pakala.
> The earlier branch 1.2.c1 was being shared with other SPs and we cut this
> branch to restrict code churn accordingly.
> As far as 1.1.c3 is concerned we aligned with the original main branch

Well... Whatever happens, the version should not go backwards.

-- 
With best wishes
Dmitry
