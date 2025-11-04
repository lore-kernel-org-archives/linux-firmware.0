Return-Path: <SRS0=7UQK=5M=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A051CCF9F8
	for <linux-firmware@archiver.kernel.org>; Tue,  4 Nov 2025 02:05:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E0550C4CEFD; Tue,  4 Nov 2025 02:05:49 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 91052C4CEE7
	for <linux-firmware@kernel.org>; Tue,  4 Nov 2025 02:05:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 91052C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A3H33Yj3595213
	for <linux-firmware@kernel.org>; Tue, 4 Nov 2025 02:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=E/w1YMPNK+yy1MQZWbIOCtTn
	vpPWQ4yIpTVNDi65Lc4=; b=mxw27RyUUYk3HPW7yD3krzZp78C7Pb8hj6LXG/zU
	L+OccMFSyT8AyrCsQYAdflmMFBI1wY3Hu5zhWeuvEof4c+wVv06q2b3/d2ZuINBQ
	n/b2bwcZyg8mN46exSgtbwN1CXfxeLA/2EkLsV+aXzRZXZcch3VuQgYJclyAW60q
	gKtZNYVb3jnPBYpc8qs9HrDU37jXE7y+7vzDox8ElRuZ6Pc+kaBavXSDodBf71OB
	ZO3XmGMCZQviwHGCLkJM2Z+R/PGDYzPnsftZbbhUOJenPgqyTVfTlqNXMHCsXWDI
	1W7CYXy8hksvBV7WwS0lW+PB0X1aTxcs5EaClFTkGkJt8g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a70exha0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 04 Nov 2025 02:05:47 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-340be2e9c4bso2337077a91.1
        for <linux-firmware@kernel.org>; Mon, 03 Nov 2025 18:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762221946; x=1762826746; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E/w1YMPNK+yy1MQZWbIOCtTnvpPWQ4yIpTVNDi65Lc4=;
        b=ggdl9ozwylBLgDBWSSBiVDS3auzYfDIKiYcNsukuMIm9D5BUtJA7sf5KDe89Bqvroz
         dXhb+Cw7Jgqfk/+pDXKSmmpRQpDHVCppPjmC6TEYm/KMtE9dZzmo91aWbT+fvpF6zX3Z
         cbmKAAYCMrQ2eXwvod96dCXt+YSmZvejJhl6g60qNdN8250A7Q/Q3Lxljn/PUWWAiWWk
         M4uoE4/xrHpEyHx3apw5XfTHbZOrxvd8/75m4pD1TAqU2O1CrtClk7FB2BXibbVDPxr8
         91rLTPMYmjlqXz6+TtOp15KAzR8Mtv6qeb5IS3wdepATGelGEFjAbztdk5U/zil0GK0m
         P9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762221946; x=1762826746;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E/w1YMPNK+yy1MQZWbIOCtTnvpPWQ4yIpTVNDi65Lc4=;
        b=E9DyHKW8e/tMGCv3vP7NqF8xl7w8YssCgAfc1F+iMpjSXBwb+wNoXccXWMFhx0Qtq1
         ztPgv19Nq6CrAmPyCsQ117TUJReNOPeEH2xi+zgBa9sTpGqrPFqKIPvOuYMyJfBqCYlN
         Fz9men1P3fNh59qf43hbxcf9H30fwKRKRk6Xw/QKw5oY2OPVJQcOosmh+ss1yoYFJG3p
         pYx8+vdQp+zXZyycc8acmir4cZeaK+jo+lak/YID0fT0XeJDYWoXXd7aPDdCOo3eAsGa
         VjATLpm6lcWTomO0CWFoxndkHm2kafeyrwsbysMPUaVt2/Vp5r7m37CHv4SwZzv0nape
         6Ifw==
X-Gm-Message-State: AOJu0Yxo3n2tj79lBV/LVap/uvevxUZL0xSyV46jM+l3Kqb0EPg8xVl4
	iyCSKjXHCjxqKHj16M3U3/Tsbck2kYcPgB64pG6SR/ksyfKRCEXw/8vtOqyEfQ00AEq/aKeYGZE
	WMHQi5PbJKmzuXI90Mqy2jdidUDw4sT6lS52FTJ/Sz2rpTLj5+Gfa+endPd3JoxU8IwLIFqvP+w
	adlJX3jcYolYxKDoDxqFMLGDMcpcAVi25lJcF5YhsbtDBc7A==
X-Gm-Gg: ASbGncsSqWqYige///tYBTAsnhyyI/ZSZADohxsEqMvFuBUUvMJP246fs3LSqiuP3DD
	sH5szUf+PInYFuO6DUBE+qeKsIkSqhRyZwRb4Hp6G6E3cxnK43CrfNGUCGzFv78QG39f9xluhnr
	kVqu8TmfSqh+8X7F/EZCl7+2KcLgMK0bmYRlzS489PRveGZ2/u10DZvhSa
X-Received: by 2002:a17:90b:48c4:b0:341:3ea2:b625 with SMTP id 98e67ed59e1d1-3413ea2c515mr5329797a91.12.1762221946164;
        Mon, 03 Nov 2025 18:05:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEB51HoBh9dcrOdp2sf1z+qygY0XIVPp1OF9QGlIfnLO3VZXo3wDYuZ2nGnvMHGxI6cHkzny+UN0QTNQk7UxSM=
X-Received: by 2002:a17:90b:48c4:b0:341:3ea2:b625 with SMTP id
 98e67ed59e1d1-3413ea2c515mr5329774a91.12.1762221945600; Mon, 03 Nov 2025
 18:05:45 -0800 (PST)
MIME-Version: 1.0
References: <2c54ba08-67b4-4bb2-926b-de0e7cdd47bc@oss.qualcomm.com>
 <o6ta2s4ykj2kfinqrsf7ej7qjgfi6t6wyrc6jdpzjup6cveti3@gy467gpjkm52> <3f0c6e11-5194-484b-8458-ffd56db0db1a@oss.qualcomm.com>
In-Reply-To: <3f0c6e11-5194-484b-8458-ffd56db0db1a@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 4 Nov 2025 04:05:34 +0200
X-Gm-Features: AWmQ_bkizYNhu7vQq5eBL31xOgEgoNA18LN3WkV2Tk3YYXrybGwjjp1R5pxZjhs
Message-ID: <CAO9ioeXtDZm+K1QtGt_CgFRh-krNjbR8EW247Yi=wRcyiDQCVQ@mail.gmail.com>
Subject: Re: qcom: add SOCCP firmware for kaanapali platform
To: Xin Liu <xin.liu@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=APHuRV3Y c=1 sm=1 tr=0 ts=69095f7b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8
 a=cePutwujrv8UxW3MtEkA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: K0_wXatsgbabkmPN9gyT4spszDkF9QsJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDAxNSBTYWx0ZWRfX8sy8c375+3bN
 glUxHJx3ZM9BFtAuWLgWOwixiuNfy8bEweE3ObDxKpToITo+aoWL79jR8IqiJ6PxmzLvOiW+CIn
 Oigcz7NKBMeER0eyJy2o1fJNH29d4c27QCeoL8i2EQRW++gPIi2+jyr7Nqw/P93Y13vvBfkUXcK
 pfZcwwwAM24Bh0VlKJ9oUGct8DHJzccG1rq2pulLv5/ILffPmhxRr3dR6OSmr6Dsw1YlK48Jlwq
 AvHl0lRVe6fQJ3ziITKwZqJ/92+0M8Z8cEZHct45WvGljmNz6vJbqgHkOg5cu2mWii+IL1znCKc
 ED30tawot+iZeP/nJ+xRGcZ6u0vIdsLZhWLHFILp+sJzxxL/oXNahYfLQ5S+ocyoeKxad1CD3X9
 Erjxu5l+I5mfTVD/aJK3Q9SHHOrK/A==
X-Proofpoint-ORIG-GUID: K0_wXatsgbabkmPN9gyT4spszDkF9QsJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040015

On Tue, 4 Nov 2025 at 04:03, Xin Liu <xin.liu@oss.qualcomm.com> wrote:
>
> On 10/31/2025 9:52 PM, Dmitry Baryshkov wrote:
>
> > On Fri, Oct 31, 2025 at 04:16:30PM +0800, Xin Liu wrote:
> >> The following changes since commit 7234d25d1884114901070a9c42380e104e48a136:
> >>
> >>    Merge branch 'amd-ucode' into 'main' (2025-10-31 05:05:13 +0000)
> >>
> >> are available in the Git repository at:
> >>
> >>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git soccp-knp
> >>
> >> for you to fetch changes up to 90db1091087d0cc4af93160c0a52312738515174:
> >>
> >>    qcom: add SOCCP firmware for kaanapali platform (2025-10-31 16:08:38
> >> +0800)
> >>
> >> ----------------------------------------------------------------
> >> Xin Liu (1):
> >>        qcom: add SOCCP firmware for kaanapali platform
> >>
> >>   WHENCE                       |   4 ++++
> >>   qcom/kaanapali/soccp.mbn     | Bin 0 -> 2359480 bytes
> >>   qcom/kaanapali/soccp_dtb.mbn | Bin 0 -> 94008 bytes
> >>   qcom/kaanapali/soccpr.jsn    |  14 ++++++++++++++
> > Could you please check whether it should be covered by LINCESE.qcom or
> > LINCESE.qcom-2?
> LINCESE.qcom-2

Then why are you adding it to the block of files covered by LICENSE.qcom??

Also note, you did something fancy with your pull request, so it
wasn't recognized by the robot. Please send a normal pull request (see
the mailing list archives if you are unsure how it should look).

> >>   4 files changed, 18 insertions(+)
> >>   create mode 100644 qcom/kaanapali/soccp.mbn
> >>   create mode 100644 qcom/kaanapali/soccp_dtb.mbn
> >>   create mode 100644 qcom/kaanapali/soccpr.jsn



-- 
With best wishes
Dmitry
