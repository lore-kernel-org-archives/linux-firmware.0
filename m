Return-Path: <SRS0=fUOl=52=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F30CEE34D
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Nov 2025 19:45:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6AD28C4AF09; Tue, 18 Nov 2025 19:45:28 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 30123C2BC86
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 19:45:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 30123C2BC86
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIGCauL2249881
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 19:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VuK0WVox4keIJHOzAKpM/yrMbWVPysmCaiszn3alsRg=; b=OadmiBMNumweXTyy
	66ucl5VKtHrgg6lm3mbZlMN/02BxCXDJIU/XuxEFlS6KgpPWg14NpKI8uKMETehx
	ma5pky8y3DIz+eOXUUOhWSytF8scfJj1EcCMHbwqY9zi5774Mf5dectl6PCJv1SW
	tqvG1poNMEgw7lAuZpZkcy6jx2XxdzFkfzeDu4k7EbRVduYRjWx0wooOFZ+WhOn9
	8wri9c21qW3oTVUpceT+EnjUNQkMXn7fdULGbNVmGyaqNt5EnF7If2Ci1XoEifMY
	TXpxXznTuD2Ewl6cMRclxy7hAM62Fkl07vATgrelJ6R+6LoMRTEt+y30wjUdZgAl
	YBa9Bg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agnc5hyx1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 19:45:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b24b811fb1so38102585a.1
        for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 11:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763495118; x=1764099918; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VuK0WVox4keIJHOzAKpM/yrMbWVPysmCaiszn3alsRg=;
        b=OOH+qNPsAegFaK4K0YDb+AiNXdYThb5B9th0fccE+Aa2vomheeYV0MGL7a4FkFxw7B
         zPTvHFYNxZdtaAc3jiEO2JmIQFwEQLXaJKtoxC4LiTE9Q12vXJ3bW3uDOAsdhb+dbbWl
         t5pZCHOYcVa6v11oI6AWeGhdZJkIdu/9QjqNSvwWYqiMmahkVLBiMthIBShViRBVp1Wk
         GoRvHZMFVH4MUz+djPAXfJycT+Ha6V3oaUcf6stmqxLnSRQGessJuKisJ6hvtEdgm99U
         9LFzgKEafTUhnfWCNROJhbtzLgGoohX474SSQMqA9+wZim3bH+tLotpe5h6yRFeKLPIM
         8mSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763495118; x=1764099918;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VuK0WVox4keIJHOzAKpM/yrMbWVPysmCaiszn3alsRg=;
        b=pw1QbVoZFZLlCiRwGbm8RolcLVNx1QxsKeoJzsq+KQy9u+NTtEPGaRKGzbjFDPs373
         yyvUTXX8hClc1k+0OECSURi0AYmxCTxAhqbwGeuIP0D8glmyQSRCvffJZdK67YdGONW5
         Cr2k2TvATLI0b2o4hlOh/de+U2AgzfxtOX5TOhaYbqCR+1TQY03AA1LZx8zPuGwufqLC
         lhUTs5+TEctgeePbgMQ7abhGNDrATwy87ViGAifHrpBROZY1GtS3pdDga1BpRKLiEvm6
         0+qGUohHsfojMRhtgPvE9BzGoQ0RaUQxfKhm9GZ2s/R1L0a1KzfoU0ZZyuTC8OAJ+h9R
         m1IA==
X-Gm-Message-State: AOJu0YyxFPLqD3ylcqgnpOuZxDn3MDWetYDcr2IRxWW5CKjiBUnQK3HZ
	Lv254V5Ku4BCWLPN+/hicl4jVabQhfzl7J7lfx8DkJMJahlpJBDkdVEf+2fTXKPoVOcC5ZLdRzO
	s4pWDR1BZ+sV6W58mzXOtM7DgjYmAKnSLEvF9lneU4Qhj73ORhZZYtQw+MkWElgw=
X-Gm-Gg: ASbGncvR4AmT4LCAdhZKwBGPL1U2NgFQnROsHogejnUwtC4F77dep5cKaEQ0qMk9G18
	gX5vi/6F8iWH9RIO/h6RfZVV0RczPvy7RBEz8DV+V/Yr1Ja8P2pslo6wYxEZB8WGBaVQuzbgs1P
	tAPyy8TQh4AS9eUdnWFH1Pw7YL+/Qht6i8HjUxfrQuDBLLlCG18hH73hT7xzpHTbIvYRMFU2IfO
	+Hv8rfxUVLNQCFIXB+3j++SSPnfH7F7Ve4qwkcunFWChZ8zldb8r82Zr52ngmcfH3/UexnzDn62
	xcDN2Fqel28na6pchF3GB8ivFSePWnpW0V4JFn3NOYGtepiJQ3UpsOis9rxpWTqz/2xAYCbhVQ+
	hc8CS5CaIqttMwj35XdgHhoYlQrBgXn47+deN8gYfXKdZiC31Ql4WXf7mpi8aEcjk/u//w/YWGA
	faTar8cL53f9gEp+e/B9JbDtM=
X-Received: by 2002:a05:620a:1a25:b0:8b2:63ae:6343 with SMTP id af79cd13be357-8b3174c9b96mr11100185a.28.1763495118048;
        Tue, 18 Nov 2025 11:45:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF9qSt4TgPjJ6cSZAJTNhJpxh1099kyVbV9aWjoHyZK6itR9PxKIuclZpI/SchsN3RcRpBgew==
X-Received: by 2002:a05:620a:1a25:b0:8b2:63ae:6343 with SMTP id af79cd13be357-8b3174c9b96mr11095985a.28.1763495117540;
        Tue, 18 Nov 2025 11:45:17 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59580405777sm4192904e87.91.2025.11.18.11.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 11:45:14 -0800 (PST)
Date: Tue, 18 Nov 2025 21:45:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, kssb@qti.qualcomm.com, psaddam@qti.qualcomm.com
Subject: Re: qcom: Update DSP firmware for Kaanapali platform
Message-ID: <yh2aitnbknjfwp4h7j2v3d6epaqjkf2tk4vlaxuqpmxozios7m@4vnxsqlqztfo>
References: <a067192f-ec95-4cf9-89a9-e1eefffcf166@oss.qualcomm.com>
 <ypeyd37oonsm55cenq5xl4lpxtdyhuqlt2nlgweottnwagujjr@v54m5ki367wl>
 <c5de392e-9c65-4021-b7e7-3a81329f170a@oss.qualcomm.com>
 <CAO9ioeVYMOR_+QdkQk6YM0YdH0Hvi+TjmUfQ6-X7=nLfnG9JbQ@mail.gmail.com>
 <3a84fa28-e4a8-4875-b655-293011d3ce63@oss.qualcomm.com>
 <tqpvpnh7f2gbkhw733aux44vzfcd6fd5i4e55zxidj6rl7jafh@6y7776gkbgyf>
 <217efcc4-2b34-4c57-bdda-16adc064a5ed@oss.qualcomm.com>
 <lxldmx2ulavqsijroufa6btxf67t2bocjovnjzxeeqbdd35ri3@dhouz4i7so42>
 <d3646263-0ffe-4a16-9baf-81202d481ea8@oss.qualcomm.com>
 <2b6b8cc3-ece6-485d-8295-e7fa039f5093@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2b6b8cc3-ece6-485d-8295-e7fa039f5093@oss.qualcomm.com>
X-Proofpoint-GUID: ZNnZNfDC17Tr7SNg2wiLwWK5bBTEo-Tf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDE1NyBTYWx0ZWRfX8cRyEuWpcG+q
 KwaCO6du9FVOkt0ZPP8Mm7QSvXLPFel9bNrwDjilkaIdNoNPAdChlmUahYYK39KTTzOG8cze09p
 FjrRWhijNIryq+6db1JFryQiKgLgqNhg4DsatnhJs57I94drEON5SxYpZtEMTXul0rYlCzxQZWV
 ELJTvNYAtpoI5B8gzD9xZV03f8ZeOFzNrmIxVrqsRioNMsR8Rc5aTPlMuMw1VymE83tzP0Bvihl
 nZd0iw11rVDPElVzCbJkU2/WTkrwmZR816WGw+V6RaS0WQjBYY0wFRo5TfRr8PYr5C4dETZoifW
 Obcq4yTxqBydsmd26SvhZzTebXCILVld8lvc2qe2/fNOFJwd18vhygT/AkdhdbyVoYEddoQYK0P
 Hgx/xgX8QZ5CM8WjCO0vlYPe+z66tA==
X-Authority-Analysis: v=2.4 cv=BYTVE7t2 c=1 sm=1 tr=0 ts=691ccccf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8 a=MPq7zsLD2_J3YDbiqoAA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: ZNnZNfDC17Tr7SNg2wiLwWK5bBTEo-Tf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180157

On Wed, Nov 19, 2025 at 12:20:03AM +0530, Venkata Kota wrote:
> 
> 
> On 11/18/2025 11:40 PM, Venkata Kota wrote:
> > 
> > 
> > On 11/18/2025 11:26 PM, Dmitry Baryshkov wrote:
> > > On Tue, Nov 18, 2025 at 09:20:23PM +0530, Venkata Kota wrote:
> > > > 
> > > > 
> > > > On 11/18/2025 9:04 PM, Dmitry Baryshkov wrote:
> > > > > On Tue, Nov 18, 2025 at 08:05:04PM +0530, Venkata Kota wrote:
> > > > > > 
> > > > > > 
> > > > > > On 11/18/2025 7:56 PM, Dmitry Baryshkov wrote:
> > > > > > > On Tue, 18 Nov 2025 at 16:21, Venkata Kota
> > > > > > > <venkata.kota@oss.qualcomm.com> wrote:
> > > > > > > > 
> > > > > > > > 
> > > > > > > > 
> > > > > > > > On 11/18/2025 4:28 PM, Dmitry Baryshkov wrote:
> > > > > > > > > On Tue, Nov 18, 2025 at 10:24:03AM +0530, Venkata Kota wrote:
> > > > > > > > > > The following changes since commit
> > > > > > > > > > 53adb2085ca81337df2db20b96898b1980e310ff:
> > > > > > > > > > 
> > > > > > > > > >       Merge branch 'aic100_1_20_2_6'
> > > > > > > > > > into 'main' (2025-11-18 03:16:11 +0000)
> > > > > > > > > > 
> > > > > > > > > > are available in the Git repository at:
> > > > > > > > > > 
> > > > > > > > > >      
> > > > > > > > > > https://git.codelinaro.org/clo/linux-kernel/linux-
> > > > > > > > > > firmware.git
> > > > > > > > > > dsp-fw-kaanapali
> > > > > > > > > > 
> > > > > > > > > > for you to fetch changes up to
> > > > > > > > > > d6afd7f0d0c9f4649880f36eff7a5fe4ef0386cf:
> > > > > > > > > > 
> > > > > > > > > >       qcom: update ADSP, CDSP firmware
> > > > > > > > > > for kaanapali platform (2025-11-18
> > > > > > > > > > 10:20:00 +0530)
> > > > > > > > > > 
> > > > > > > > > > ----------------------------------------------------------------
> > > > > > > > > > Venkata Kota (1):
> > > > > > > > > >           qcom: update ADSP, CDSP firmware for kaanapali platform
> > > > > > > > > > 
> > > > > > > > > >      WHENCE                      |   4 ++--
> > > > > > > > > >      qcom/kaanapali/adsp.mbn     | Bin 19879944 -> 20703432 bytes
> > > > > > > > > >      qcom/kaanapali/adsp_dtb.mbn | Bin 184120 -> 188216 bytes
> > > > > > > > > >      qcom/kaanapali/cdsp.mbn     | Bin 4956632 -> 4960728 bytes
> > > > > > > > > >      qcom/kaanapali/cdsp_dtb.mbn | Bin 40760 -> 40760 bytes
> > > > > > > > > >      5 files changed, 2 insertions(+), 2 deletions(-)
> > > > > > > > > 
> > > > > > > > > Should these files be covered by LICENSE.qcom or LICENSE.qcom-2?
> > > > > > > > The files should be covered under LICENSE.qcom-2
> > > > > > > > Made the change to the
> > > > > > > > WHENCE file to reflect the same as below
> > > > > > > > The following changes since commit
> > > > > > > > 53adb2085ca81337df2db20b96898b1980e310ff:
> > > > > > > > 
> > > > > > > >       Merge branch 'aic100_1_20_2_6' into 'main'
> > > > > > > > (2025-11-18 03:16:11 +0000)
> > > > > > > > 
> > > > > > > > are available in the Git repository at:
> > > > > > > > 
> > > > > > > >       https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > > > > > > > dsp-fw-kaanapali
> > > > > > > > 
> > > > > > > > for you to fetch changes up to
> > > > > > > > db069c95dcc16ea84dacb80488464e843ea252cc:
> > > > > > > 
> > > > > > > You've silently changed the licence without
> > > > > > > mentioning anything in the
> > > > > > > commit message. That's a no-go.
> > > > > > <Noted> Made the change to the commit message accordingly.>
> > > > > 
> > > > > Could you please add a word about it to the commit subject
> > > > > too? ('update
> > > > > firmware for kaanapali platform, change the licence')
> > > > Updated. Please Review.>
> > > 
> > > Now, why do we have two groups for kaanapali there? One with soccp and
> > > another one which you have just added.
> > I am not sure about soccp FW. DSP team does not track that firmware. Do
> > you suggest to have all of these close by. I was not aware of soccp and
> > just add Kaanapali fw below the rest of the DSP FW.>
> SOCCP is for RISC-V and the DSP FW is for the ADSP and CDSP.>>>>>>>

And what is the difference for anybody outside of Qualcomm? It's just
firmware for remoteprocs on the Kaanapali platform. Neither does it
matter, which team manages the firmware. Please group the entries.

-- 
With best wishes
Dmitry
