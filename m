Return-Path: <SRS0=fUOl=52=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D95CEE347
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Nov 2025 17:56:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 768BFC4CEF1; Tue, 18 Nov 2025 17:56:37 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E160BC4CEFB
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 17:56:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E160BC4CEFB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIAQkgC2926623
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 17:56:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2Qa+XHSg7crTsyiwV4mPgalP
	W8mOwcxEOIRmQlKdQYY=; b=Z2NjfRF/D/lHXJOkWzIbyFsJoWF486jdBYqZySn1
	yzgZqXW0Oyz6gwaDhvG217UKgLtI/zutIob8xGaWNaK8ykfkkg7VMXD5Jgg26UjP
	2F16gfuh3eO2iJffMBWakWqZo36ocAjpozs1PpIIdcAZ4r7ciTWllqXVXW1ZwLr5
	HNN69Y738Zpn4fBjImYt4Uat/lrv37DURvNJdkfHjz0OivcnTaJMz2ShPcML3QY8
	S37Ohz8FQnpG+HHgnapB00V0+4uvSentxIc2FGsQDZGLfyGUpSgklsiLEhOUfrl1
	ZMjkoy6tesyzectypCJ6lS74Q3FQfd8S9dwMwXRAEpvZfA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agq2919tj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 17:56:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee09211413so100891281cf.2
        for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 09:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763488582; x=1764093382; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2Qa+XHSg7crTsyiwV4mPgalPW8mOwcxEOIRmQlKdQYY=;
        b=JEt4W5IMj6llCec713GzBk1OnGQxv+VUgbr8znVYRvVNsfo7rVXsyV7CJXZyHa9/os
         OqZuS4hmJfgurawC3MnAZNteLfaNlUrwehJgfZqXocpkAJNwsDmv78vhNhwwmySc6RZG
         5CF0a4o+m2wwiKZJFs1wgh2WVU0g6WgUrCfhDbl936Ai7YLYn4T7wjEwZ2iTGFzsjxga
         saRvDgGvRpv/2u7f0XJdJsiT9x8RdMCqi7cfpuWQb7cszs2/ev7oniPw5sEMjEA8tYLp
         LjHUgRYRX937tG4uyFVz0MnBxNQWW74z2cC7HSG25OzTZ0ss8ABk+S8C6+wV6UW2+zUs
         /8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763488582; x=1764093382;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Qa+XHSg7crTsyiwV4mPgalPW8mOwcxEOIRmQlKdQYY=;
        b=cDDZ3A+u/0ZkA+o5MGcGxVyOnuustQ79dkP0bMdpjW8v5RF5XUXPzznXMMcO5sPDRV
         em5p+osXrdWqO3J/3hOxvBcUjigskvvP5hDB35S9t/vzlsFkLVcHcLgVMTPzmzrTwStV
         XyFnTjT4DEz2qaULKeqdPatKEYM5BeGElY0RVj+cZkUTiEY04ikn/1s3HtTFDHbT06uS
         JkC/CJdwr4WmihIwgpxl/9QB57KaUuhtkXN3Sd9J3VAmPmNXzy9WtCOonxxjK7kaRQ3/
         RYdVolhouYj11GPITA4b6sNUiRxQeL0z7xWvSn8870r+kFCbnpwr0UgVp4vYHGW0GjFQ
         8pyg==
X-Gm-Message-State: AOJu0YwKrTnoOZtNgwamnSt+EPB/q9Hl+rFOBbw4To9v2nDv2R0f+HZX
	OOSYX9TLddaSdDJiqdq+5CR+v236+8aIZI5D2kC1zL3sHmZBBdo45SuSiRd+zdirqlC/jEObxf6
	Qa26XZ6nFg9VoHIJsaGLx8xJs9wqRoYM/+ZXGFOjSZqX8i8JHsc45UUNFo/zI+rA=
X-Gm-Gg: ASbGncsMRA/oWlOtZzm45cza2uc2/nnbuTZUqJLng5FefxEky/cPSzuOK9eHXRnueyX
	TfX+L6LgE3DvLZf9uLsO2MzPPmagREGok0EuhFLpTT7yVMuK50u4ygzWrcvcwQGhS9x7P+RuxdW
	6b/1kRYXhDQZmmM9FTN5DN6YuBgkk0N2Vdp2tdD9CfWjW5RXqA/NqJDYcy3/GBkDpyuyM/fWr7J
	Bq4uI+ttCTEnUa5mR8CluK6yM8lj09JxfLcpKpe1iyT686dwK7GqLi8tyL+v+FKKYDlhzZFFAI0
	50Xjj1IT2YgV7+2AaIJ7eNuIe3G10uNllG+tbtsGBI0hhoX0OtHK709yUTrKDKCfR3dvr6Dd08o
	He3GWwf3wAV5RQvPl3TUVaIAYNYIlzCPst+AU+x7xmJdsLvyinjT4Ez9uJkdj5BpYBF+FW1zBQs
	NaDUxqjnqFm0Z4
X-Received: by 2002:a05:622a:138a:b0:4ee:1ed1:43c6 with SMTP id d75a77b69052e-4ee1ed14523mr108278781cf.10.1763488581777;
        Tue, 18 Nov 2025 09:56:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjoUJRx1CzyuP1pmd46kAieafzIgblwvh/ZZfND4FvlJ/eJqaHIt/J4FEmu38xpoCjdv8Vsg==
X-Received: by 2002:a05:622a:138a:b0:4ee:1ed1:43c6 with SMTP id d75a77b69052e-4ee1ed14523mr108278521cf.10.1763488581274;
        Tue, 18 Nov 2025 09:56:21 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37b9cef2bb2sm37560161fa.46.2025.11.18.09.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 09:56:20 -0800 (PST)
Date: Tue, 18 Nov 2025 19:56:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, kssb@qti.qualcomm.com, psaddam@qti.qualcomm.com
Subject: Re: qcom: Update DSP firmware for Kaanapali platform
Message-ID: <lxldmx2ulavqsijroufa6btxf67t2bocjovnjzxeeqbdd35ri3@dhouz4i7so42>
References: <384a6882-c95a-499c-9bcb-35af092118be@oss.qualcomm.com>
 <a067192f-ec95-4cf9-89a9-e1eefffcf166@oss.qualcomm.com>
 <ypeyd37oonsm55cenq5xl4lpxtdyhuqlt2nlgweottnwagujjr@v54m5ki367wl>
 <c5de392e-9c65-4021-b7e7-3a81329f170a@oss.qualcomm.com>
 <CAO9ioeVYMOR_+QdkQk6YM0YdH0Hvi+TjmUfQ6-X7=nLfnG9JbQ@mail.gmail.com>
 <3a84fa28-e4a8-4875-b655-293011d3ce63@oss.qualcomm.com>
 <tqpvpnh7f2gbkhw733aux44vzfcd6fd5i4e55zxidj6rl7jafh@6y7776gkbgyf>
 <217efcc4-2b34-4c57-bdda-16adc064a5ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <217efcc4-2b34-4c57-bdda-16adc064a5ed@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=FJgWBuos c=1 sm=1 tr=0 ts=691cb346 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8 a=42n4a48h5UUS6tXtLfwA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: 11GGitc_dq27VtZSBDhAY5fN2AlFjBFC
X-Proofpoint-GUID: 11GGitc_dq27VtZSBDhAY5fN2AlFjBFC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDE0NSBTYWx0ZWRfX0KYpLoH5jdQ7
 RXpS1m8qptZvJSX60uw8z6//gXMFfkdwlC5FeGAIICxIBmcRBrVUik0dkXuIZ58+d3YK3WnSH2I
 NidZ7UhktX6MTYwRKn9t1iRUX2eRr+L4O1A+o2kWju62QO4aR8I9izQbshwYcMdddtRmvcmv9A2
 sQhZ7/xnoZet8G822/H4K14y55H3SgYe6JhI+u6bfAiMWtI8Vau6Bb3XeBHZ/lIFW8V81sFkVJA
 X6NpejZFvbJTpCjvyFdK12fGqZ9S4YKrIFD0fHpxu4F9Tw6MI2fiQs0fGzAOCAq8as7QxVLSy7G
 DIMeVGySqUfWLnrZXuwsGWwAYGH7+MjgTufUQScPJ26gVndgp3V609WFCVuy8Ifh6wRrrrieyo8
 TwSqwxYwWcaeIaT/j+fZ+VriX0RzZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180145

On Tue, Nov 18, 2025 at 09:20:23PM +0530, Venkata Kota wrote:
> 
> 
> On 11/18/2025 9:04 PM, Dmitry Baryshkov wrote:
> > On Tue, Nov 18, 2025 at 08:05:04PM +0530, Venkata Kota wrote:
> > > 
> > > 
> > > On 11/18/2025 7:56 PM, Dmitry Baryshkov wrote:
> > > > On Tue, 18 Nov 2025 at 16:21, Venkata Kota
> > > > <venkata.kota@oss.qualcomm.com> wrote:
> > > > > 
> > > > > 
> > > > > 
> > > > > On 11/18/2025 4:28 PM, Dmitry Baryshkov wrote:
> > > > > > On Tue, Nov 18, 2025 at 10:24:03AM +0530, Venkata Kota wrote:
> > > > > > > The following changes since commit 53adb2085ca81337df2db20b96898b1980e310ff:
> > > > > > > 
> > > > > > >      Merge branch 'aic100_1_20_2_6' into 'main' (2025-11-18 03:16:11 +0000)
> > > > > > > 
> > > > > > > are available in the Git repository at:
> > > > > > > 
> > > > > > >      https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > > > > > > dsp-fw-kaanapali
> > > > > > > 
> > > > > > > for you to fetch changes up to d6afd7f0d0c9f4649880f36eff7a5fe4ef0386cf:
> > > > > > > 
> > > > > > >      qcom: update ADSP, CDSP firmware for kaanapali platform (2025-11-18
> > > > > > > 10:20:00 +0530)
> > > > > > > 
> > > > > > > ----------------------------------------------------------------
> > > > > > > Venkata Kota (1):
> > > > > > >          qcom: update ADSP, CDSP firmware for kaanapali platform
> > > > > > > 
> > > > > > >     WHENCE                      |   4 ++--
> > > > > > >     qcom/kaanapali/adsp.mbn     | Bin 19879944 -> 20703432 bytes
> > > > > > >     qcom/kaanapali/adsp_dtb.mbn | Bin 184120 -> 188216 bytes
> > > > > > >     qcom/kaanapali/cdsp.mbn     | Bin 4956632 -> 4960728 bytes
> > > > > > >     qcom/kaanapali/cdsp_dtb.mbn | Bin 40760 -> 40760 bytes
> > > > > > >     5 files changed, 2 insertions(+), 2 deletions(-)
> > > > > > 
> > > > > > Should these files be covered by LICENSE.qcom or LICENSE.qcom-2?
> > > > > The files should be covered under LICENSE.qcom-2 Made the change to the
> > > > > WHENCE file to reflect the same as below
> > > > > The following changes since commit 53adb2085ca81337df2db20b96898b1980e310ff:
> > > > > 
> > > > >      Merge branch 'aic100_1_20_2_6' into 'main' (2025-11-18 03:16:11 +0000)
> > > > > 
> > > > > are available in the Git repository at:
> > > > > 
> > > > >      https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > > > > dsp-fw-kaanapali
> > > > > 
> > > > > for you to fetch changes up to db069c95dcc16ea84dacb80488464e843ea252cc:
> > > > 
> > > > You've silently changed the licence without mentioning anything in the
> > > > commit message. That's a no-go.
> > > <Noted> Made the change to the commit message accordingly.>
> > 
> > Could you please add a word about it to the commit subject too? ('update
> > firmware for kaanapali platform, change the licence')
> Updated. Please Review.>

Now, why do we have two groups for kaanapali there? One with soccp and
another one which you have just added.

> > > > > 
> > > > >      qcom: update ADSP, CDSP firmware for kaanapali platform (2025-11-18
> > > > > 19:45:11 +0530)
> > > > 
> > > > 
> > > 
> > 
> 

-- 
With best wishes
Dmitry
