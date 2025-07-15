Return-Path: <SRS0=szWL=Z4=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498CAC83F21
	for <linux-firmware@archiver.kernel.org>; Tue, 15 Jul 2025 12:16:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 11808C4CEF1; Tue, 15 Jul 2025 12:16:01 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 14278C4CEF6
	for <linux-firmware@kernel.org>; Tue, 15 Jul 2025 12:15:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 14278C4CEF6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F7OJVY022925
	for <linux-firmware@kernel.org>; Tue, 15 Jul 2025 12:15:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qQshqSJppmjuQDH0iSsYoZBt
	I2BizECOMTbyBsc6SEI=; b=RQk/rIELWxg7d0tjYkQtIzejqLdMeHpMEHeQ7U2P
	TpmHCMaAO+I2TIOKKtvXaE5+H8myWJFZblt6+tJgu0FvvAdln4s84pbsi5AJDgal
	PhZHmh+gFZW6+iE9whVbngwZpeeYIANdt0XRjpRbfYgxbSNQ92BMzJwpccvPtMVW
	6wRy4WpgOJ3KEMVMFDRf3ybUNLsMVVFawmkWHRZYe/z4KCmiTjtCPnnVWJ29yzrG
	3ra0vcBy9YVS5h3aOdDobCvnf2i0E/21g0DWcQVqVZTVLLONQ4nsIod1cJucXlc5
	umGxo6W3LxPyOzywqljf9Xl43Wy6bp0+saslI4m+ufTuZg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxb065q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 15 Jul 2025 12:15:58 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-533164999b1so1899722e0c.3
        for <linux-firmware@kernel.org>; Tue, 15 Jul 2025 05:15:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752581757; x=1753186557;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQshqSJppmjuQDH0iSsYoZBtI2BizECOMTbyBsc6SEI=;
        b=BvX6FOHmEPFSCpNWVMWEk3Om8RKlyDKU/I2TWd2OiGTvnrkdZA+ibk6Cu9MT9mCOqL
         TDl5AyJXxNJy0xDmB4mwZMsnPbB90BugEliTXQ1xH9mjuDqMPnqrcVBGyUYp24hxFmSg
         4evVjzjO9nnkq9jqBWBzCsqz9XwCKKhGvqiSGXYVIXVonHLo3t1mDYSmFZ1WrUrefOmy
         1vpFz/aB5L69ZnBD2wvtNciOFsnxXOFVFJfb+QajqdCbmdSBtHHqhcdfAxvjVDluFRko
         kBYR6Nb3o+t6sh+71Dbgogg0u+pXAuoCT+AVW/cLRhNfy771GaJL/B1UAHSlgrUKnjG1
         FcOg==
X-Gm-Message-State: AOJu0Yw6BKz7GoiqYcCeZxkM381DpXRExFFD9hZAxWIdEUJGM1ZJ6M97
	GVT6VUJ0kPadOW6XNMMkDxjQkR/zYy5ag3IQg5UeZzfGowuDVOFhuBXJtfuhjYTiya9t3k9Dg9e
	3kRKx3BmIAleEQ4OkclAgynVaILaEgFgNzPELT1y+b+gEcG98bugCmOdpt+Spew0Z/y0R8/8=
X-Gm-Gg: ASbGncvd2zD7DT62jk2wyr9O7YIbzRDNJPPjOajnT3ULvoxXENHm0vHvZ/3TUpjWQAp
	dBdY232AP+vfDgKgLrSAY46FYW+/9I143/hAIJRdBsk+hAo98vQmYnCwoVwoonn5KGMNfZw1mZO
	GmsN9hchLFw8yhFaavk7AY9aMq2NW345vgJwlXSBbTXmJQcfP/t6kUYVX6A4ShaA8RObZisDSIL
	6PylWn9FOSuQFPUtaOPulXZkmcaFrfQ3ONteNBnn9Cog/f4bfrrGgm5ri1t/GgdJgs8tryD7FuN
	DwK52vOMpMfuYrvccEae/+d06cEIWcJTq6q9EKhLJwGRNgjC/7Es7+Krse2PPDqhAOjGEkyYQnD
	pGe7SiLKgDJPX4RqfVAaB9V/sDRa491ExArDTbQ4h/q3rEot1zgA7
X-Received: by 2002:a05:6122:1e0d:b0:531:2afc:463f with SMTP id 71dfb90a1353d-535f47c3fcemr9248590e0c.6.1752581757344;
        Tue, 15 Jul 2025 05:15:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1XH8tCh+CkbaE1wYl+xvIu+lmvflVMfZu1oNIbipegLl2gPbu9rtBVLtWv08TiqSocmHkmQ==
X-Received: by 2002:a05:6122:1e0d:b0:531:2afc:463f with SMTP id 71dfb90a1353d-535f47c3fcemr9248531e0c.6.1752581756455;
        Tue, 15 Jul 2025 05:15:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32fa291391esm18501191fa.17.2025.07.15.05.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 05:15:55 -0700 (PDT)
Date: Tue, 15 Jul 2025 15:15:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: qcom: Update GPU firmwares of QCS615 chipset -v2
Message-ID: <pnhpmwpdnhkexejum5zriq62wj7y46ot4elrlvcvwpmmfvk4mq@lskjszqjyedx>
References: <d2e4501a-937f-413d-a58a-1a461c7947c2@oss.qualcomm.com>
 <cefhytvrazclwp3qicixaf3wh2p4vffhakt62of4cqua7rj7ok@r7gdz3nhgo2p>
 <27ae02e3-bb40-4bcd-a74a-eb228833add0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27ae02e3-bb40-4bcd-a74a-eb228833add0@oss.qualcomm.com>
X-Proofpoint-GUID: 7z3AQi7PnAtrv7k8EJMbjJ9gU66zzB4P
X-Proofpoint-ORIG-GUID: 7z3AQi7PnAtrv7k8EJMbjJ9gU66zzB4P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDExMSBTYWx0ZWRfX4Ag5/J+FnYVe
 GK0MRrLDSkSFgX+IeadEWWOaVxVbvxrk4e0Gs8puKZq1tJ1ztVA41HcpCTV2v9vRuzdJvTVPzQ6
 reUevJMzyxOkG9WT67pq/0yDy4tDbRbXEgB6tVAtYr4wAHRk89LKXcHpnpxXpuPTdopzCYnP7it
 VRTFwM3hbX/nrH+V1U0864moi7//SKkC1Cmn/nSD/HPS2FyzTFY2Wr1wzWxHMYO4p3kKaL95p/Z
 5mnox3aXBAlRTxHJypZU78GLXbTRZzUwmJrL/qUqcA4C86op8Hc6vrc/oQ4xT3xJ8W+WjzcrjNq
 FztjAR7qrE/eNhqzzPR1PErA26tnGeZTWgYKKQHv2ZIphGirzeje3NSjDaGGOoqZLxJaBzaiXOG
 EKiMkdvzF8DIuxbkUWVSnhsE68l9P1rIru29331u+bXAUfjep1J+4KxwLCAqyFEvIQKC9rLh
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=6876467e cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8 a=vMh6leDkcedJev9I7fMA:9
 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-15_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=920
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150111

On Tue, Jul 15, 2025 at 11:58:08AM +0530, Akhil P Oommen wrote:
> On 7/15/2025 3:54 AM, Dmitry Baryshkov wrote:
> > On Mon, Jul 14, 2025 at 10:55:03PM +0530, Akhil P Oommen wrote:
> >> Hi,
> >>
> >> Add/update the gpu firmwares required for Qualcomm's QCS615 chipset.
> >>
> >> -Akhil
> >>
> >> ---
> >> The following changes since commit 99d64b4f788c16e81b6550ef94f43c6b91cfad2d:
> >>
> >>   Merge branch 'amd-ucode' into kfw (2025-07-08 12:00:49 -0400)
> >>
> >> are available in the Git repository at:
> >>
> >>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git gpu-fw-QCS615v3
> >>
> >> for you to fetch changes up to 6907a7a381dd13d7fadc3a480ad470151c3f3782:
> >>
> >>   qcom: Update gpu firmwares of QCS615 chipset (2025-07-14 22:47:07 +0530)
> >>
> >> ----------------------------------------------------------------
> >> Akhil P Oommen (1):
> >>       qcom: Update gpu firmwares of QCS615 chipset
> >>
> >>  WHENCE                   |   3 +++
> >>  qcom/a612_rgmu.bin       | Bin 0 -> 3072 bytes
> >>  qcom/qcs615/a612_zap.mbn | Bin 14256 -> 14256 bytes
> > 
> > This also sets several additional flags (OEM_ID, OEM_ID_INDEPENDENT,
> > etc). Could you please confirm that the new file is actually necessary
> > and that it will work with existing SM6150 devices?
> 
> This firmware file is for the not-yet-commercialized QCS615 chipset
> which has a newer non-hlos which uses a new security profile. SM6150 is
> around 8 years old by now. And it is not supported in upstream yet, so
> no user afaik.
> 
> In case the sm6150 gains upstream support, a zap firmware that works for
> it should be available at qcom/sm6150 directory. I think the current
> firmware with v1 profile may work, but can't be completely sure unless
> someone test it on sm6150. Not-a-lawyer, but in that case, I think
> anybody can copy it from the git history of linux-firmware to qcom/sm6150.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
