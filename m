Return-Path: <SRS0=w3AB=IH=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38BBBCCF2C9
	for <linux-firmware@archiver.kernel.org>; Sat, 17 Oct 2026 20:12:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E8B121F000C5; Sat, 17 Oct 2026 20:12:34 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792267954;
	b=kEMFDydPZIkTzOieoVR6dpmR9e8ZcpBdjgr2pYjiN+MWy7PuVgNY1tpWYvlIUlvNas5v
	 tzpZa02oi1aWYCXU025GtLQ78ut5DStsX+UPWUd0BojvuWen4E88kkLtB/7T+bSzRGyXG
	 b5PmMZRlm6LWOoA+g9BOFDWodjxktmg2DI3QTfU+XPrEsrNdaFq0ytvAEOyOzZWz+98yc
	 qYtncIq1y0VVIwd4GHGDzPQ0LZYVduSPuNtOieLu0Arj8TBnHUe8cFBNlG2eC95Ya2pbL
	 guyUz7L1ieiawAoTrH6C7IviqBYEa2fKOIwlmB1hgbr8pngI5XofroDXEp/zDmTQzHw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792267954;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5X4jXEaRt51Jl2WqMP1pyQId/td98rMSReTk0FvyxF4=;
	b=nFeQ1x4EQURi+W8eDCBjbB2cVIl5cuGE2R97ZEthhlZbS2MHjlDBcQsJYC1aKeHUMDTw
	 Zw7ZnZJCrYqOU2vOdzfH059KDr9u2rlMo5230LolJ7Y8DtI0LqTi2owszYVIGU/hlMotR
	 DXQ90TvUtwGsnyZNWn0kxlKKtU/DQf3jaeVXveDvQ/1sHIJ4ZN1/nkpuDi12ZHlBmy65y
	 Y3HH5srGls6Cv04AV++4Ai84JrGeOlxO29Wg2qhDb30vKeGQMWUABK6TPlaCTVUHjX8Rj
	 QWmpt7DG6OVFytuGP8MXCjmc2QZoW46/7KJM3qhj0gwsPYkFyM+c/n2ZAfaqIyyEs7w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q7zXWUc9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="EhoNaR/E";
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 38C781F000C4
	for <linux-firmware@kernel.org>; Sat, 17 Oct 2026 20:12:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q7zXWUc9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EhoNaR/E
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 38C781F000C4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HJ0BL12291622
	for <linux-firmware@kernel.org>; Sat, 17 Oct 2026 20:12:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5X4jXEaRt51Jl2WqMP1pyQId
	/td98rMSReTk0FvyxF4=; b=Q7zXWUc9MCVfjrwsNIOjwSXJZDntP+C0B48+1cPd
	ikKWublMrGhk2xJhI10tqELthyrWYy8gbcDptlyDfIQnC9JsMUonr7iBsOpuHJxH
	XFXq75myk9GSAoEeyc/hMHCr3KLjalHTI4qKwR9CBARDHzVEZN88pobkTvxPpRM4
	kTABSXTbwYs2aHF8+U3MPsWmKYLQbdvWOwwTO6ADwdp2s6WAPqEwsRq8s+2vhvWt
	QgZHcXwudkyNhinj5OJotAzEulGLySegJMWNlTIj2ZFKA5EnZeFymyw1Urd2l/o8
	Yjx0JJPZbBsd4o3AW028RH3k7RldDGx3NOn77nvB/kOvKA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc016ht86-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Sat, 17 Oct 2026 20:12:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ae8e7e546so219721485a.1
        for <linux-firmware@kernel.org>; Sat, 17 Oct 2026 13:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792267952; x=1792872752; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5X4jXEaRt51Jl2WqMP1pyQId/td98rMSReTk0FvyxF4=;
        b=EhoNaR/E1g3yPZ+XM4p7dxtxLSqQIBHk+6FFusLgKReljzv8DR/l8WHVS0VEFblcS1
         Serc6Nsw1iKZ3b0jXBKxpA+eQSAcKjE3IEkH7SMbAmhDX8VeV/F2HRAI2zRinBgv++hN
         H4SYtagaQ+eIxR9iOkR9LuMxPA8Wqv6QJcUWrqphWdugciGZM2dhY3ZPpctC8VCyF9Jo
         vaQBWKPQxS76z+fEjWVNDi4lbQOvKN9l2f7uo2WJbhAH+er7B2TOvgu1G+jEYNtbPvOx
         zkKoPDoZl5JyH4OLm9e/lZhqW7nxRyIwdBbp8ulnjz45cpGXBCcTj/jm9qe/9oVO9rs+
         Q3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792267952; x=1792872752;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5X4jXEaRt51Jl2WqMP1pyQId/td98rMSReTk0FvyxF4=;
        b=f2G4Sq7wBrH1Dky6EG6rbM3WdnegCC5E2tu4riac+TIZu1lJ16vgKgpLZS34PtGtg7
         PdzqFq9CTxjT7rzaDYGhL1NRvch5Q0Iay5PezeFm+x34iBC2GkV5Zsamr+Cf+h8r9VzR
         HnpASEeROdMWyQqDMHM8NmhAXFzVAFr06099b20HQlH8sshZrjrzk93VIlDAo95crDgE
         QPhbbQD7pdNRVkrinRBLzNBs89VWH6beuc6bHl/CxEdwi419oeRYYBTJS/sl4o7oeJqT
         maMNdpQM62FEWOAiyDO6sq20UxoR0ifAZlYmyTGJgRovttByA3shH3xYJtGHxovTj6BA
         QQQA==
X-Gm-Message-State: AFq9FYKHreppTaMzzFPmSdcLPjO0WFFm9MNgzF3U4EF4xBkolvMBUmOB
	iM3ExgS/5mdXM1zFeVYaOf3utiWJasxD7OLo8UOJNGhY3U0Cq7yhnlq8b1ces8UvW/FNaxIYiKF
	XUZ2ghBIAsY2mUiBbhm1t1+pjGMualKK8J7ypdjAMj85xdaPskaePTVZJeJygAyeE8pC24ds=
X-Gm-Gg: AYBFou1z2JmPVJa/OtcWsro7KYE3rvVkFYI9yQph86gm/wSXrWoTwrBUaxfY3isA54v
	/9nz7nkU7L14+kuj3cUe4dKTrz2r9Yztr+XNzrXL7bUOq1n7JU3rVfLJvjmla6UCVMaF+BUS8RF
	ZfBQPkqsb7og2V6s2co7/S40neX8nYwg+XZtsIe0DRCh0yrMXLGlbP2poWbq5Qr4SARxBEA1cLx
	bIIGwGQc6mtO17H5S/48EEXF7qJQ7LljrmZaCKQ1CTmuJAKz+v4tQ1vprGBOUiLHPeKhsreMutZ
	3pNCzS8xfTZc39HdAMDyv52U69lLG1HStCGUZntcwmUQap450mXvH/StFIq6qdpmpnC6y4R7ijo
	gbz0FG/iPgkfBpQUCPJ7XJz0RHazer2PCaGx/L0wtjVXdC9xlh3V8j0bNgSgVkKgclVHJm1c+aC
	uzZ/2zI+d6jUF2
X-Received: by 2002:a05:620a:4507:b0:93f:2635:b6f1 with SMTP id af79cd13be357-93f29b7fa6bmr554913885a.8.1792267952328;
        Sat, 17 Oct 2026 13:12:32 -0700 (PDT)
X-Received: by 2002:a05:620a:4507:b0:93f:2635:b6f1 with SMTP id af79cd13be357-93f29b7fa6bmr554907985a.8.1792267951203;
        Sat, 17 Oct 2026 13:12:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab2860c230sm8616931fa.32.2026.10.17.13.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 13:12:28 -0700 (PDT)
Date: Sat, 17 Oct 2026 23:12:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: Update ADSP firmware for Qualcomm qcs615 platform
Message-ID: <gljhkxe5iqmxohuad2lknqncdjni26ct677qm43bif3ludo5mi@c3da7fr23yiw>
References: <2d2cae60-fb47-480b-900a-a2eed5f5fa5c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d2cae60-fb47-480b-900a-a2eed5f5fa5c@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA4MCBTYWx0ZWRfX2Xcdd8ewNsAF
 wqXllwDNZKBl6GVEci6Dvo0Lss4/e0DV+0AnTMxdG3PdRHBu0WYxZ8Vac6bmnQSM6YsSJ5vq1FJ
 NzWDCkyhkjNQgUCkBLwdNNkzVHfChfs=
X-Proofpoint-GUID: h5nwsh5bbKGYQb84SkNHMpIR5OXYlQVs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA4MCBTYWx0ZWRfX7YkJQ4KJTCvv
 67Gyrrn7giQXPkcLlzP97SG2RQ1ccrLmSSkYMhy6Nx5mQJAy7SzR9ExFoDp8myjfC2kiKYqj3FT
 uPbEC/xFbvWxBW0ivg/yqxQsYd6umrEJ8kg7S5HZW5Z/c2c41tOaVEM2TYpOjqU5bdyqbPp/o/4
 lPSIQKPDt1TC1DL/l672m1GGqFNFEiUjmqchMZ8R1GTN1t+cAPQlTnUgya/pEYaeyOlfNLjh703
 MevOixn0e9d2AA05FEExU0vh9vnP92B+33D3JrFqVZHtMCm48BuQGEdTcjOvtr/21TSrt1EsmEg
 Gmu/gZGzXN2E9KzdqIGZJXH1+H1GY6vuxJfHNaG8f59IWUpCHBVd6ciC8LJDGqeqVU1jZl1SVGO
 2uHfIfXVxejnbY2I79GD1t+dZyEJ9TYUjr1SF3V2I5wIQCfs4hmgZcXY/f29orCLUtJxf22OZje
 uwQ/4DClshQTKL4Hr4A==
X-Authority-Analysis: v=2.4 cv=COm/zhrD c=1 sm=1 tr=0 ts=6ad3d6b1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=qC_FGOx9AAAA:8
 a=p0WdMEafAAAA:8 a=vyJSbZsD_gZesJ6PukcA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: h5nwsh5bbKGYQb84SkNHMpIR5OXYlQVs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_06,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170080

On Fri, Oct 16, 2026 at 10:44:54AM +0530, Venkata Kota wrote:
> The following changes since commit 38c1a7096dfb2188f55f342b835f14c362c59409:
> 
>   Merge branch 'amd-staging' into 'main' (2026-10-16 02:31:45 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> qli-dspfw-talos
> 
> for you to fetch changes up to bada67dfbcb4faf1df951ceaf6087b4b6ce2fe4c:
> 
>   Update ADSP firmware for Qualcomm qcs615 platform. (2026-10-16 10:39:37
> +0530)
> 
> ----------------------------------------------------------------
> Venkata Kota (1):
>       Update ADSP firmware for Qualcomm qcs615 platform.

Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1308

> 

>  WHENCE               |   2 +-
>  qcom/qcs615/adsp.mbn | Bin 8532108 -> 8532108 bytes
>  2 files changed, 1 insertion(+), 1 deletion(-)

-- 
With best wishes
Dmitry
